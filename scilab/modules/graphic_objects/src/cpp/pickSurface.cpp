/*
 * Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2012 - Pedro Arthur dos S. Souza
 * Copyright (C) 2012 - Caio Lucas dos S. Souza
 *
 * Copyright (C) 2012 - 2016 - Scilab Enterprises
 *
 * This file is hereby licensed under the terms of the GNU GPL v2.0,
 * pursuant to article 5.3.4 of the CeCILL v.2.1.
 * This file was originally licensed under the terms of the CeCILL v2.1,
 * and continues to be available under such terms.
 * For more information, see the COPYING file which you should have received
 * along with this program.
 *
 */

extern "C"
{
#include <stdio.h>
#include <math.h>
#include <string.h>

#include "getGraphicObjectProperty.h"
#include "graphicObjectProperties.h"

double pickSurface(int uid, double x, double y,  double z, double dx, double dy, double dz);

}

#define EPS 1e-8

class Vec3
{
public:
    double x, y, z;

    Vec3(): x(0), y(0), z(0) {}
    Vec3(double _x, double _y, double _z): x(_x), y(_y), z(_z) {}

    Vec3 operator - (Vec3 v)
    {
        return Vec3( x - v.x, y - v.y, z - v.z );
    }

    Vec3 operator + (Vec3 v)
    {
        return Vec3( x + v.x, y + v.y, z + v.z );
    }

    Vec3 operator * (double s)
    {
        return Vec3( x * s, y * s, z * s );
    }

    Vec3 operator / (double s)
    {
        return Vec3( x / s, y / s, z / s );
    }

    double dot(Vec3 v)
    {
        return x * v.x + y * v.y + z * v.z;
    }

    Vec3 cross(Vec3 v)
    {
        return Vec3(y * v.z - z * v.y, z * v.x - x * v.z, x * v.y - y * v.x);
    }

    Vec3& normalize()
    {
        double d = sqrt(this->dot(*this));
        if (d < EPS)
        {
            x = y = z = 0;
        }
        else
        {
            x /= d;
            y /= d;
            z /= d;
        }
        return *this;
    }

    Vec3 getNormalized()
    {
        Vec3 n = Vec3(x, y, z);
        return n.normalize();
    }

    void print()
    {
        printf("\nv = %.8f, %.8f, %.8f", x, y, z);
    }
};

int test_tri(Vec3 V1, Vec3 V2, Vec3 V3, Vec3 Dir, Vec3 P0, Vec3 &ret);
void QuadTestAndSaveT(double *bounds, Vec3 P0, Vec3 P1, Vec3 P2, Vec3 P3, Vec3 direction, Vec3 point, double &retT);
void TriTestAndSaveT(double *bounds, Vec3 P0, Vec3 P1, Vec3 P2, Vec3 direction, Vec3 point, double &retT);

/*
 * Given a ray (point(x, y,z) and direction(dx, dy, dz))
 * check if the ray intersects any triangle from the given surface.
 * returns t such that the intersection point is (x, y,z) + t * (dx, dy, dz)
 * or -INFINITY if there isn't intersection.
 */

double pickSurface(int uid, double x, double y,  double z, double dx, double dy, double dz)
{
    double* X = NULL;
    double* Y = NULL;
    double* Z = NULL;

    int type;
    int * pType = &type;
    double lastT = -INFINITY;

    Vec3 direction = Vec3(dx, dy, dz);
    Vec3 point = Vec3(x, y, z);

    getGraphicObjectProperty(uid, __GO_DATA_MODEL_X__, jni_double_vector, (void**) &X);
    getGraphicObjectProperty(uid, __GO_DATA_MODEL_Y__, jni_double_vector, (void**) &Y);
    getGraphicObjectProperty(uid, __GO_DATA_MODEL_Z__, jni_double_vector, (void**) &Z);

    int axes_uid = 0;
    int * paxes_uid = &axes_uid;
    int zoom_enabled = 0;
    int *ptr = &zoom_enabled;
    double *bounds;
    getGraphicObjectProperty(uid, __GO_PARENT_AXES__, jni_int, (void**) &paxes_uid);
    getGraphicObjectProperty(axes_uid, __GO_ZOOM_ENABLED__, jni_bool, (void**) &ptr);

    if (zoom_enabled)
    {
        getGraphicObjectProperty(axes_uid, __GO_ZOOM_BOX__, jni_double_vector, (void**) &bounds);
    }
    else
    {
        getGraphicObjectProperty(axes_uid, __GO_DATA_BOUNDS__, jni_double_vector, (void**) &bounds);
    }

    getGraphicObjectProperty(uid, __GO_TYPE__, jni_int, (void**) &pType);
    if (type == __GO_PLOT3D__)
    {
        int numX = 0;
        int* piNumX = &numX;
        int numY = 0;
        int* piNumY = &numY;

        getGraphicObjectProperty(uid, __GO_DATA_MODEL_NUM_X__, jni_int, (void**) &piNumX);
        getGraphicObjectProperty(uid, __GO_DATA_MODEL_NUM_Y__, jni_int, (void**) &piNumY);

        /* for each quad in the mesh separate it in 2 triangles
         * and use test_tri function to test intersection from
         * mouse click ray
         * A point (x, y, z)  at (n,m) is given by
         * (X[n], Y[m], Z[n][m]) where X, Y are vectors and Z a matrix.
         */
        for (int i = 0; i < (numX - 1); ++i)
        {
            for (int j = 0; j < (numY - 1); ++j)
            {
                Vec3 P0 = Vec3(X[i],   Y[j],   Z[i + j * numX]);
                Vec3 P1 = Vec3(X[i + 1], Y[j],   Z[(i + 1) + j * numX]);
                Vec3 P2 = Vec3(X[i + 1], Y[j + 1], Z[(i + 1) + (j + 1) * numX]);
                Vec3 P3 = Vec3(X[i],   Y[j + 1], Z[i + (j + 1) * numX]);

                QuadTestAndSaveT(bounds, P0, P1, P2, P3, direction, point, lastT);
            }
        }
    }
    else if (type == __GO_FAC3D__)
    {
        int ng = 0, nvg = 0;
        int *png = &ng, *pnvg = &nvg;
        getGraphicObjectProperty(uid, __GO_DATA_MODEL_NUM_GONS__, jni_int, (void**) &png);
        getGraphicObjectProperty(uid, __GO_DATA_MODEL_NUM_VERTICES_PER_GON__, jni_int, (void**) &pnvg);

        // Fac3d data model is made by gons
        // each gon can be a quad
        if (nvg == 4)
        {
             /* ordered in the vector
             * X = [ p1, p2, p3, p4, p1, p2, p3, p4, ...]
             * Y = [ p1, p2, p3, p4, p1, p2, p3, p4, ...]
             * Z = [ p1, p2, p3, p4, p1, p2, p3, p4, ...]
             * where a point is given by (x, y, z)
             */
            for (int i = 0; i < ng * nvg; i += nvg)
            {
                Vec3 P0 = Vec3(X[i],   Y[i],   Z[i]);
                Vec3 P1 = Vec3(X[i + 1], Y[i + 1], Z[i + 1]);
                Vec3 P2 = Vec3(X[i + 2], Y[i + 2], Z[i + 2]);
                Vec3 P3 = Vec3(X[i + 3], Y[i + 3], Z[i + 3]);

                QuadTestAndSaveT(bounds, P0, P1, P2, P3, direction, point, lastT);
            }
        }
        // or a triangle
        else if (nvg == 3)
        {
            /* ordered in the vector
            * X = [ p1, p2, p3, p1, p2, p3, ...]
            * Y = [ p1, p2, p3, p1, p2, p3, ...]
            * Z = [ p1, p2, p3, p1, p2, p3, ...]
            * where a point is given by (x, y, z)
            */
            for (int i = 0; i < ng * nvg; i += nvg)
            {
                Vec3 P0 = Vec3(X[i],   Y[i],   Z[i]);
                Vec3 P1 = Vec3(X[i + 1], Y[i + 1], Z[i + 1]);
                Vec3 P2 = Vec3(X[i + 2], Y[i + 2], Z[i + 2]);

                TriTestAndSaveT(bounds, P0, P1, P2, direction, point, lastT);
            }            
        }
    }
    else if (type == __GO_GRAYPLOT__)
    {

        int numX = 0;
        int* piNumX = &numX;
        int numY = 0;
        int* piNumY = &numY;

        getGraphicObjectProperty(uid, __GO_DATA_MODEL_NUM_X__, jni_int, (void**) &piNumX);
        getGraphicObjectProperty(uid, __GO_DATA_MODEL_NUM_Y__, jni_int, (void**) &piNumY);

        /* Gray plot is a plane with Z = 0 and bounds = {x[0], x[n-1], y[0], y[m-1]}
         * where n = size of vector x and m = size of vector y
         */

        Vec3 P0 = Vec3(X[0],      Y[0],      0);
        Vec3 P1 = Vec3(X[numX - 1], Y[0],      0);
        Vec3 P2 = Vec3(X[numX - 1], Y[numY - 1], 0);
        Vec3 P3 = Vec3(X[0],      Y[numY - 1], 0);

        QuadTestAndSaveT(bounds, P0, P1, P2, P3, direction, point, lastT);
    }
    else if (type == __GO_MATPLOT__)
    {
        double* scale = NULL;
        double* translate = NULL;
        double zShift = 0.;
        double* pdZShift = &zShift;
        double mbounds[4];
        int numX = 0;
        int* piNumX = &numX;
        int numY = 0;
        int* piNumY = &numY;

        getGraphicObjectProperty(uid, __GO_MATPLOT_SCALE__, jni_double_vector, (void**) &scale);
        getGraphicObjectProperty(uid, __GO_MATPLOT_TRANSLATE__, jni_double_vector, (void**) &translate);
        getGraphicObjectProperty(uid, __GO_DATA_MODEL_Z_COORDINATES_SHIFT__, jni_double, (void**) &pdZShift);
        getGraphicObjectProperty(uid, __GO_DATA_MODEL_NUM_X__, jni_int, (void**) &piNumX);
        getGraphicObjectProperty(uid, __GO_DATA_MODEL_NUM_Y__, jni_int, (void**) &piNumY);

        mbounds[0] = translate[0];
        mbounds[1] = translate[1];
        mbounds[2] = mbounds[0] + (numX - 1) * scale[0];
        mbounds[3] = mbounds[1] + (numY - 1) * scale[1];

        Vec3 P0 = Vec3(mbounds[0],      mbounds[1],      zShift);
        Vec3 P1 = Vec3(mbounds[2],		mbounds[1],      zShift);
        Vec3 P2 = Vec3(mbounds[2],      mbounds[3],      zShift);
        Vec3 P3 = Vec3(mbounds[0],      mbounds[3],      zShift);

        QuadTestAndSaveT(bounds, P0, P1, P2, P3, direction, point, lastT);
    }
    return lastT;

}

/*
 * Test if the ray intersects the given triangle (V1, V2, V3)
 * Fast, minimum storage ray/triangle intersection
 * algorithm propose by Tomas Möller and Ben Trumbore.
 * Calculate barycentric cordinates (u, v) and test if
 * 0 <= u <= 1 && 0 <= v <= 1 && (u + v) <= 1, then the
 * intersection point is inside the triangle.
 */
int test_tri(Vec3 V1, Vec3 V2, Vec3 V3, Vec3 Dir, Vec3 P0, double &t)
{
    Vec3 Edge1, Edge2, tVec, pVec, qVec;
    double det, inv_det, u, v;

    Edge1 = V2 - V1;
    Edge2 = V3 - V1;

    pVec = Dir.cross(Edge2);
    det = Edge1.dot(pVec);

    if (det > -EPS && det < EPS)
    {
        return 0;
    }

    inv_det = 1 / det;

    tVec = P0 - V1;
    u = tVec.dot(pVec) * inv_det;

    if (u < 0.0 || u > 1.0)
    {
        return 0;
    }

    qVec = tVec.cross(Edge1);
    v = Dir.dot(qVec) * inv_det;

    if (v < 0.0 || (u + v) > 1.0)
    {
        return 0;
    }

    t = Edge2.dot(qVec) * inv_det;

    return 1;
}

bool isInViewBox(double * bounds, Vec3 point)
{
    return (bounds[0] <= point.x && bounds[1] >= point.x &&
            bounds[2] <= point.y && bounds[3] >= point.y &&
            bounds[4] <= point.z && bounds[5] >= point.z);
}

void QuadTestAndSaveT(double *bounds, Vec3 P0, Vec3 P1, Vec3 P2, Vec3 P3, Vec3 direction, Vec3 point, double &retT)
{
    TriTestAndSaveT(bounds, P0, P1, P2, direction, point, retT);
    TriTestAndSaveT(bounds, P0, P2, P3, direction, point, retT);
}

void TriTestAndSaveT(double *bounds, Vec3 P0, Vec3 P1, Vec3 P2, Vec3 direction, Vec3 point, double &retT)
{
    Vec3 intersectionPoint;
    double t;
    /*test first triangle*/
    if (test_tri(P0, P1, P2, direction, point, t) == 1)
    {
        /*the intersection point can be outside the view box(invisible)*/
        intersectionPoint = point + direction * t;        
        if (isInViewBox(bounds, intersectionPoint))
        {
            // ray intersects the triangle, we store the greatest t (nearest from viewpoint) 
            retT = retT > t ? retT : t;
        }
    }
}




// =============================================================================
// Scilab ( https://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Simon MARCHETTO
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

jimport java.io.FileInputStream;
jimport java.util.zip.ZipInputStream;
jimport java.util.zip.ZipEntry;

testRootDir = fullfile(TMPDIR, "jcreatejar");
mkdir(testRootDir);

// Create a sub dir of a dir, and clean it if exists
function path = createSubDir(parentDir, subDir, removeExistingDir)
    path = fullfile(parentDir, subDir);
    if isdir(path) & removeExistingDir then
        removedir(path);
    end
    mkdir(path);
endfunction

// Create a file to be JAR-red with a given filename & content, create the parent dir if needed
function [filePath, fileContent] = addFileToPackage(fileName, package, packageDir, fileContent)
    destDir = packageDir;
    if ~isempty(package) then
        fileDirs = strsplit(package, "."),
        for i = 1:size(fileDirs, "*")
            destDir = createSubDir(destDir, fileDirs(i), %F);
        end
    end
    filePath = fullfile(destDir, fileName);

    fd = mopen(filePath, "wt");
    if ~isempty(fileContent)
        mputl(fileContent, fd);
    else
        mputl(fileName, fd);
    end
    mclose(fd);
endfunction

// Extracts a file from the JAR (ZIP) stream
function fileContent = extractFileContent(zipInputStream)
    BUFFER_SIZE = 1000;
    buffer = jarray("byte", BUFFER_SIZE);
    n = zipInputStream.read(buffer, 0, BUFFER_SIZE);
    if n > 0 then
        fileContent = junwrap(buffer);
        fileContent = fileContent(find(fileContent <> 0));
        fileContent = char(fileContent);
    else
        fileContent = [];
    end
    jremove(buffer);
endfunction

// Extracts JAR content (through JIMS) with Java Zip functions
function [filePaths, fileContents] = extractJarContent(zipFilePath)
    filePaths = [];
    fileContents = [];

    fileInputStream = FileInputStream.new(zipFilePath);
    zipInputStream = ZipInputStream.new(fileInputStream);

    zipEntry = jinvoke(zipInputStream, "getNextEntry");

    while ~isempty(zipEntry)
        isDirectory = jinvoke(zipEntry, "isDirectory");
        if ~isDirectory then
            zipEntryName = jinvoke(zipEntry, "getName");
            filePaths = [filePaths; zipEntryName];
            fileContent = extractFileContent(zipInputStream);
            fileContents = [fileContents; fileContent];
        end
        jinvoke(zipInputStream, "closeEntry");
        zipEntry = jinvoke(zipInputStream, "getNextEntry");
    end
    zipEntry = jinvoke(zipInputStream, "close");
endfunction

// Checks JAR archive : uncompress JAR and check extracted files
function checkJar(jarFilePath, expectedJarFilePaths, expectedJarFileContents)
    assert_checktrue(isfile(jarFilePath));
    [jarFilePaths, jarFileContents] = extractJarContent(jarFilePath);
    jarFilePaths = gsort(jarFilePaths);
    expectedJarFilePaths = gsort(expectedJarFilePaths);
    assert_checkequal(jarFilePaths, expectedJarFilePaths);
    if ~isempty(expectedJarFileContents) then
        assert_checkequal(jarFileContents, expectedJarFileContents);
    end
endfunction

// TEST JAR STRUCTURE

// Test create jar with one file, by giving the dir path
packageName = "packageOneClassArgDirPath";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
addFileToPackage("FooDir", "", jarSrcPath, "");
jcreatejar(jarDestPath, jarSrcPath);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"; "FooDir"], []);

// Test create jar with one file, by giving the file path
packageName = "packageOneClassArgFilePath";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
filePath = addFileToPackage("FooFile", "", jarSrcPath, "");
jcreatejar(jarDestPath, filePath);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"; "FooFile"], []);

// Test create jar with two files, by giving the dir path
packageName = "packageTwoClassesArgDirPath";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
addFileToPackage("FooDir1", "", jarSrcPath, "");
addFileToPackage("FooDir2", "", jarSrcPath, "");
jcreatejar(jarDestPath, jarSrcPath);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"; "FooDir1"; "FooDir2"], []);

// Test create jar with two files, by giving the file paths
packageName = "packageTwoClassesArgFilePaths";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
filePath1 = addFileToPackage("FooFile1", "", jarSrcPath, "");
filePath2 = addFileToPackage("FooFile2", "", jarSrcPath, "");
jcreatejar(jarDestPath, [filePath1, filePath2]);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"; "FooFile1"; "FooFile2"], []);

// Test create jar with two files and one folder, by giving the dir path
packageName = "packageOneFolderArgDirPath";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
addFileToPackage("FooRoot", "", jarSrcPath, "");
addFileToPackage("FooFolder", "folder", jarSrcPath, "");
jcreatejar(jarDestPath, jarSrcPath);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"; "folder/FooFolder"; "FooRoot"], []);

// Test create a standard package 'org.scilab.test.package'
packageName = "org.scilab.test.mypackage";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
addFileToPackage("FooPackage1", packageName, jarSrcPath, "");
addFileToPackage("FooPackage2", packageName, jarSrcPath, "");
jcreatejar(jarDestPath, jarSrcPath);
checkJar(jarDestPath, ..
  ["META-INF/MANIFEST.MF"; ..
  "org/scilab/test/mypackage/FooPackage1"; ..
  "org/scilab/test/mypackage/FooPackage2"], ..
  []);

// Test argument files root path
packageName = "packageFilesRootPath";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
addFileToPackage("image1", "images", jarSrcPath, "");
addFileToPackage("image2", "images", jarSrcPath, "");
addFileToPackage("icon1", "images/icon", jarSrcPath, "");
jcreatejar(jarDestPath, jarSrcPath, jarSrcPath);
checkJar(jarDestPath, ..
  ["META-INF/MANIFEST.MF"; ..
  "images/icon/icon1"; ..
  "images/image1"; ..
  "images/image2"] ..
  , []);

// TESTS JAR MANIFEST

// Manifest data
// Manifest need version, otherwise the created manifest may be empty
manifestData = msprintf("Manifest-Version: 1.0\nName: testManifest");
CRLF = ascii([13 10]);
expectedManifestData = "Manifest-Version: 1.0" + CRLF + ..
  "Name: testManifest" + CRLF + CRLF;

// Test META-INF\MANIFEST.MF manifest file is loaded
packageName = "packageManifest";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
addFileToPackage("MANIFEST.MF", "META-INF", jarSrcPath, manifestData);
jcreatejar(jarDestPath, jarSrcPath);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"], [expectedManifestData]);

// Test argument manifest file path
packageName = "packageManifest";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
// Create a manifest file somewhere
manifestFilePath = fullfile(testRootDir, "MANIFEST_TEST.MF");
fd = mopen(manifestFilePath, "wt");
mputl(manifestData, fd);
mclose(fd);
jcreatejar(jarDestPath, jarSrcPath, "", manifestFilePath);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"], [expectedManifestData]);

// OTHER TESTS

// Test JAR overwriting
packageName = "packageOverwriting";
jarSrcPath = createSubDir(testRootDir, packageName, %T);
jarDestPath = fullfile(testRootDir, packageName + ".jar");
addFileToPackage("Foo", "", jarSrcPath, "");
jcreatejar(jarDestPath, jarSrcPath);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"; "Foo"], []);
// overwrite package
addFileToPackage("Foo2", "", jarSrcPath, "");
jcreatejar(jarDestPath, jarSrcPath);
checkJar(jarDestPath, ["META-INF/MANIFEST.MF"; "Foo"; "Foo2"], []);

// Test error when creating JAR of invalid file
tmpDir = getlongpathname(TMPDIR);
jarDestPath = fullfile(tmpDir, "checkerror.jar");
jarSrcPath = fullfile(tmpDir, "notfoundfile");
assert_checkequal(execstr("jcreatejar(jarDestPath, jarSrcPath)", "errcatch"), 999);

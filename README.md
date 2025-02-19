# Tik's exif rename
### Rename any file with metadata from the file and move it to a different directory
- current release only takes into account Make and CreateDate to identify which Device it was recorded from. future considerations will follow

#### Download and clone exiftool
```
git clone https://github.com/exiftool/exiftool.git
```

#### Build and compile exiftool for use in Nix/WSL
```
  perl Makefile.PL
  make
  make test
  make install
```

#### Pull 
- First, Navigate to the directory you have the files with metadata then execute below
```
git clone https://github.com/tikg/rename-with-exif.git
cp rename-with-exif/tik-rename-with-exif.sh .
```
### Now you're ready to execute!
#### Execute bash and indicate filetype
```
# Sample command, replace <JPG> with the filetype you desire
./tik-exif-rename.sh <JPG>
```


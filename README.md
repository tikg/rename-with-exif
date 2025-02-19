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
- First, Navigate to the directory you have the files with metadata
```
git clone https://github.com/tikg/rename-with-exif.git
```
#### Execute bash and indicate filetype
```
./tik-exif-rename.sh JPG 
```


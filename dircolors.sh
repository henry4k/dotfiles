#!/bin/bash
set -e

# Supported terminals
dircolors -p | grep -E '^TERM '

none=00
bold=01
italic=03
underscore=04
blink=05
reverse=07
concealed=08

black_fg=30
red_fg=31
green_fg=32
yellow_fg=33
blue_fg=34
magenta_fg=35
cyan_fg=36
white_fg=37

black_bg=40
red_bg=41
green_bg=42
yellow_bg=43
blue_bg=44
magenta_bg=45
cyan_bg=46
white_bg=47

# Basic file types
cat << EOF
#NORMAL $none # no color code at all
#FILE $none # regular file: use no color at all
RESET 0 # reset to "normal" color
DIR $bold;$blue_fg # directory
LINK $bold;$cyan_fg # symbolic link. (If you set this to 'target' instead of a
MULTIHARDLINK $none # regular file with more than one link
FIFO $black_bg;$yellow_fg # pipe
SOCK $bold;$magenta_fg # socket
DOOR $bold;$magenta_fg # door
BLK $black_bg;$yellow_fg;$bold # block device driver
CHR $black_bg;$yellow_fg;$bold # character device driver
ORPHAN $black_bg;$red_fg;$bold # symlink to nonexistent file, or non-stat'able file
SETUID $white_fg;$red_bg # file that is setuid (u+s)
SETGID $black_fg;$yellow_bg # file that is setgid (g+s)
CAPABILITY $black_fg;$red_bg # file with capability
STICKY_OTHER_WRITABLE $black_fg;$green_bg # dir that is sticky and other-writable (+t,o+w)
OTHER_WRITABLE $blue_fg;$green_bg # dir that is other-writable (o+w) and not sticky
STICKY $white_fg;$blue_bg # dir with the sticky bit set (+t) and not other-writable
EXEC $bold;$green_fg # Files with execute permission
EOF

function PrintColors()
{
    local color="$1"
    shift 1
    for ft in $@; do
        echo "$ft $color"
    done
}

# Archives / compressed
PrintColors "$bold;$red_fg" \
    .tar .tgz .arj .taz .lzh .lzma .tlz .txz .zip .z .Z \
    .dz .gz .lz .xz .bz2 .bz .tbz .tbz2 .tz .deb .rpm \
    .jar .war .ear .sar .rar .ace .zoo .cpio .7z .rz

# Images
PrintColors "$bold;$magenta_fg" \
    .jpg .jpeg .gif .bmp .pbm .pgm .ppm .tga .xbm .xpm \
    .tif .tiff .png .svg .svgz .xcf .psd .ora

# Audio
PrintColors "$bold;$magenta_fg" \
    .aac .flac .mid .midi .mka .mp3 .ogg \
    .wav .m4a .oga .xspf .mod

# Videos
PrintColors "$bold;$magenta_fg" \
    .mng .mov .mpg .mpeg .mkv .webm .ogm .mp4 .m4v \
    .mp4v .wmv .avi .flv .ogv

# Other Media
PrintColors "$bold;$magenta_fg" \
    .blend* .ply .obj .mtl .iqm \
    .pdf .doc .docx .ppt .odp

# Sources
PrintColors "$green_fg" \
    .c .cpp .h .hpp .inl \
    .sh .bash .csh .zsh .bat .com .tup .cmake \
    .nut .py .py3 .rb .js .pl .lua .vim .php \
    .glsl .vert .frag

# Makefiles
PrintColors "$bold;$blue_fg" \
    *Makefile *Tupfile *CMakeLists.txt

# Objects / compiled
PrintColors "$blue_fg" \
    .o .so .lib .a .pyc .cnut

# Configuration
PrintColors "$bold" \
    .cfg .conf .ini .json .xml .yaml .yml .html .htm .css .markdown .md .mustache

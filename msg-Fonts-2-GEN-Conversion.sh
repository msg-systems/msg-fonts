#!/bin/sh
##
##  msg-Fonts-2-GEN-Conversion.sh -- Convert original fonts into msg Fonts
##  Copyright (c) 2015-2020 msg systems ag <http://www.msg.group>
##  Requirements: OpenPKG packages "fontforge", "fonttools", "xmlpatch"
##

src="msg-Fonts-1-SRC"
gen="msg-Fonts-2-GEN"
dtp="msg-Fonts-3-DTP"
web="msg-Fonts-4-WEB"

#   helper function for converting a font
convert () {
    source="$1"; pch="$2"; dst="$3"
    echo "++ $dst"
    echo "-- importing source into TTF"
    case "$source" in
        *.ttf ) cp $source tmp1.ttf ;;
        *.otf ) fontconvert $source tmp1.ttf >/dev/null 2>&1 ;;
    esac
    echo "-- disassembling TTF to TTX"
    ttx -q -o tmp2.ttx tmp1.ttf
    echo "-- patching TTX"
    xmlpatch -s -i $pch tmp2.ttx || exit $?
    echo "-- reassembling TTX to TTF"
    ttx -q -o tmp3.ttf tmp2.ttx
    echo "-- exporting as DTP TTF"
    fontconvert tmp3.ttf $dst >/dev/null 2>&1 || exit $?
    echo "-- exporting as Web TTF/WOFF/WOFF2/CSS"
    fontface -l -u '0000-00FF,2000-20CF,FB00-FB06' -O "ttf,woff,woff2,css" -o $web/ $dst
    rm -f tmp1.ttf tmp2.ttx tmp3.ttf
}

#   generate msg Edge
convert $src/SourceSansPro-Light.otf          $gen/msgEdge-NormalRegular.xmlpatch  $dtp/msgEdge-NormalRegular.ttf
convert $src/SourceSansPro-LightIt.otf        $gen/msgEdge-NormalItalic.xmlpatch   $dtp/msgEdge-NormalItalic.ttf
convert $src/SourceSansPro-Regular.otf        $gen/msgEdge-BoldRegular.xmlpatch    $dtp/msgEdge-BoldRegular.ttf
convert $src/SourceSansPro-RegularIt.otf      $gen/msgEdge-BoldItalic.xmlpatch     $dtp/msgEdge-BoldItalic.ttf

#   generate msg Text
convert $src/SourceSansPro-Regular.otf        $gen/msgText-NormalRegular.xmlpatch  $dtp/msgText-NormalRegular.ttf
convert $src/SourceSansPro-RegularIt.otf      $gen/msgText-NormalItalic.xmlpatch   $dtp/msgText-NormalItalic.ttf
convert $src/SourceSansPro-Semibold.otf       $gen/msgText-BoldRegular.xmlpatch    $dtp/msgText-BoldRegular.ttf
convert $src/SourceSansPro-SemiboldIt.otf     $gen/msgText-BoldItalic.xmlpatch     $dtp/msgText-BoldItalic.ttf

#   generate msg Head
convert $src/SourceSansPro-Semibold.otf       $gen/msgHead-NormalRegular.xmlpatch  $dtp/msgHead-NormalRegular.ttf
convert $src/SourceSansPro-SemiboldIt.otf     $gen/msgHead-NormalItalic.xmlpatch   $dtp/msgHead-NormalItalic.ttf
convert $src/SourceSansPro-Bold.otf           $gen/msgHead-BoldRegular.xmlpatch    $dtp/msgHead-BoldRegular.ttf
convert $src/SourceSansPro-BoldIt.otf         $gen/msgHead-BoldItalic.xmlpatch     $dtp/msgHead-BoldItalic.ttf

#   generate msg Note
convert $src/Kalam-Light.ttf                  $gen/msgNote-NormalRegular.xmlpatch  $dtp/msgNote-NormalRegular.ttf
convert $src/Kalam-Light.ttf                  $gen/msgNote-NormalItalic.xmlpatch   $dtp/msgNote-NormalItalic.ttf
convert $src/Kalam-Regular.ttf                $gen/msgNote-BoldRegular.xmlpatch    $dtp/msgNote-BoldRegular.ttf
convert $src/Kalam-Regular.ttf                $gen/msgNote-BoldItalic.xmlpatch     $dtp/msgNote-BoldItalic.ttf

#   generate msg Code
convert $src/Hack-Regular.ttf                 $gen/msgCode-NormalRegular.xmlpatch  $dtp/msgCode-NormalRegular.ttf
convert $src/Hack-Italic.ttf                  $gen/msgCode-NormalItalic.xmlpatch   $dtp/msgCode-NormalItalic.ttf
convert $src/Hack-Bold.ttf                    $gen/msgCode-BoldRegular.xmlpatch    $dtp/msgCode-BoldRegular.ttf
convert $src/Hack-BoldItalic.ttf              $gen/msgCode-BoldItalic.xmlpatch     $dtp/msgCode-BoldItalic.ttf

#   generate msg Deco
convert $src/Overlock-Regular.ttf             $gen/msgDeco-NormalRegular.xmlpatch  $dtp/msgDeco-NormalRegular.ttf
convert $src/Overlock-Italic.ttf              $gen/msgDeco-NormalItalic.xmlpatch   $dtp/msgDeco-NormalItalic.ttf
convert $src/Overlock-Bold.ttf                $gen/msgDeco-BoldRegular.xmlpatch    $dtp/msgDeco-BoldRegular.ttf
convert $src/Overlock-BoldItalic.ttf          $gen/msgDeco-BoldItalic.xmlpatch     $dtp/msgDeco-BoldItalic.ttf

#   aggregate CSS files
cat \
$web/msgEdge-NormalRegular.css \
$web/msgEdge-NormalItalic.css \
$web/msgEdge-BoldRegular.css \
$web/msgEdge-BoldItalic.css > \
$web/msgEdge.css
cat \
$web/msgText-NormalRegular.css \
$web/msgText-NormalItalic.css \
$web/msgText-BoldRegular.css \
$web/msgText-BoldItalic.css > \
$web/msgText.css
cat \
$web/msgHead-NormalRegular.css \
$web/msgHead-NormalItalic.css \
$web/msgHead-BoldRegular.css \
$web/msgHead-BoldItalic.css > \
$web/msgHead.css
cat \
$web/msgNote-NormalRegular.css \
$web/msgNote-NormalItalic.css \
$web/msgNote-BoldRegular.css \
$web/msgNote-BoldItalic.css > \
$web/msgNote.css
cat \
$web/msgCode-NormalRegular.css \
$web/msgCode-NormalItalic.css \
$web/msgCode-BoldRegular.css \
$web/msgCode-BoldItalic.css > \
$web/msgCode.css
cat \
$web/msgDeco-NormalRegular.css \
$web/msgDeco-NormalItalic.css \
$web/msgDeco-BoldRegular.css \
$web/msgDeco-BoldItalic.css > \
$web/msgDeco.css
cat \
$web/msgEdge.css \
$web/msgText.css \
$web/msgHead.css \
$web/msgCode.css \
$web/msgNote.css \
$web/msgDeco.css > \
$web/msg.css


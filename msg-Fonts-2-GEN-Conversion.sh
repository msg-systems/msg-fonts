#!/bin/sh
##
##  msg-Fonts-2-GEN-Conversion.sh -- Convert original fonts into msg Fonts
##  Copyright (c) 2015-2019 msg systems ag <http://www.msg.group>
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

#   generate msg Signal
convert $src/SourceSansPro-Bold.otf           $gen/msgCISignal-BoldRegular.xmlpatch    $dtp/msgCISignal-BoldRegular.ttf
convert $src/SourceSansPro-BoldIt.otf         $gen/msgCISignal-BoldItalic.xmlpatch     $dtp/msgCISignal-BoldItalic.ttf
convert $src/SourceSansPro-Semibold.otf       $gen/msgCISignal-NormalRegular.xmlpatch  $dtp/msgCISignal-NormalRegular.ttf
convert $src/SourceSansPro-SemiboldIt.otf     $gen/msgCISignal-NormalItalic.xmlpatch   $dtp/msgCISignal-NormalItalic.ttf

#   generate msg Text
convert $src/SourceSansPro-Regular.otf        $gen/msgCIText-BoldRegular.xmlpatch      $dtp/msgCIText-BoldRegular.ttf
convert $src/SourceSansPro-RegularIt.otf      $gen/msgCIText-BoldItalic.xmlpatch       $dtp/msgCIText-BoldItalic.ttf
convert $src/SourceSansPro-Light.otf          $gen/msgCIText-NormalRegular.xmlpatch    $dtp/msgCIText-NormalRegular.ttf
convert $src/SourceSansPro-LightIt.otf        $gen/msgCIText-NormalItalic.xmlpatch     $dtp/msgCIText-NormalItalic.ttf

#   generate msg Code
convert $src/SourceCodePro-Regular.otf        $gen/msgCSCode-BoldRegular.xmlpatch      $dtp/msgCSCode-BoldRegular.ttf
convert $src/SourceCodePro-RegularIt.otf      $gen/msgCSCode-BoldItalic.xmlpatch       $dtp/msgCSCode-BoldItalic.ttf
convert $src/SourceCodePro-Light.otf          $gen/msgCSCode-NormalRegular.xmlpatch    $dtp/msgCSCode-NormalRegular.ttf
convert $src/SourceCodePro-LightIt.otf        $gen/msgCSCode-NormalItalic.xmlpatch     $dtp/msgCSCode-NormalItalic.ttf

#   generate msg Note
convert $src/Kalam-Regular.ttf                $gen/msgCSNote-BoldRegular.xmlpatch      $dtp/msgCSNote-BoldRegular.ttf
convert $src/Kalam-Regular.ttf                $gen/msgCSNote-BoldItalic.xmlpatch       $dtp/msgCSNote-BoldItalic.ttf
convert $src/Kalam-Light.ttf                  $gen/msgCSNote-NormalRegular.xmlpatch    $dtp/msgCSNote-NormalRegular.ttf
convert $src/Kalam-Light.ttf                  $gen/msgCSNote-NormalItalic.xmlpatch     $dtp/msgCSNote-NormalItalic.ttf

#   aggregate CSS files
cat \
$web/msgCISignal-NormalRegular.css \
$web/msgCISignal-NormalItalic.css \
$web/msgCISignal-BoldRegular.css \
$web/msgCISignal-BoldItalic.css > \
$web/msgCISignal.css
cat \
$web/msgCIText-NormalRegular.css \
$web/msgCIText-NormalItalic.css \
$web/msgCIText-BoldRegular.css \
$web/msgCIText-BoldItalic.css > \
$web/msgCIText.css
cat \
$web/msgCSCode-NormalRegular.css \
$web/msgCSCode-NormalItalic.css \
$web/msgCSCode-BoldRegular.css \
$web/msgCSCode-BoldItalic.css > \
$web/msgCSCode.css
cat \
$web/msgCSNote-NormalRegular.css \
$web/msgCSNote-NormalItalic.css \
$web/msgCSNote-BoldRegular.css \
$web/msgCSNote-BoldItalic.css > \
$web/msgCSNote.css
cat \
$web/msgCISignal.css \
$web/msgCIText.css \
$web/msgCSCode.css \
$web/msgCSNote.css > \
$web/msg.css


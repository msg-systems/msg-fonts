
msg Fonts
=========

Created: 2015-09-05<br/>
Modified: 2020-10-02

![msg Fonts](preview-small.png)

Challenge
---------

The msg Research division of the [msg group](https://www.msg.group/)
wants to use professional typography in the following four usage
contexts:

- *Adobe Creative Suite* products (Photoshop, Illustrator, InDesign)
- *Micosoft Office* products (PowerPoint, Word)
- *HTML5 Single-Page-Applications* (SPA)
- *Web-Sites*

For this, professional fonts are required which cover the following
four major use cases:

- *Edge*: For caption and discreet text. (all regular use)
- *Text*: For regular body text. (all regular use)
- *Head*: For header and call-out text. (all regular use)
- *Note*: For scripted and annotated text only. (exceptional and very spare use only)
- *Code*: For mono-spaced and source-code text only. (exceptional and very spare use only)
- *Deco*: For stand-alone quotes and decorative text only. (exceptional and very spare use only)

Solution
--------

As most commercial fonts cannot be used unrestricted (especially when
it comes to embedding the font and wide spreading the results), Open
Source licensed fonts are used. The [TypoPRO](http://typopro.org/)
project provides an extensive and hand-collected set of those fonts.
Inspired by TypoPRO, we have chosen 24 individual fonts to cover the
above six major use cases and prepared the fonts for the above four
usage contexts. The font sources are:

- Adobe Source Sans Pro 3.006 (2019-09)<br/>
  https://adobe-fonts.github.io/source-sans-pro/<br/>
  https://github.com/adobe-fonts/source-sans-pro/<br/>
  Open Font License 1.1

- Kalam 1.020 (2014)<br/>
  http://www.google.com/fonts/specimen/Kalam<br/><br/>
  http://www.google.com/fonts#UsePlace:use/Collection:Kalam<br/>
  Open Font License 1.1

- Overlock 1.002 (2006)<br/>
  http://www.fontsquirrel.com/fonts/overlock<br/>
  http://www.fontsquirrel.com/fonts/download/overlock
  Open Font License 1.1

- Hack 3.003 (2018)<br/>
  http://sourcefoundry.org/hack/<br/>
  https://github.com/chrissimpkins/Hack/releases
  SIL, Bitstream Vera License, Public Domain

The particular preparation consists of mapping font family names, font
weights and font styles in the following way:

    --------------------------------    -----------------------------
    SOURCE:                             TARGET:
    --------------- -------- -------    -------------- ------ -------
    Family          Weight   Style      Family         Weight Style
    --------------- -------- -------    -------------- ------ -------
    Source Sans Pro Light    Regular    msg Edge       Normal Regular
    Source Sans Pro Light    Italic     msg Edge       Normal Italic
    Source Sans Pro Normal   Regular    msg Edge       Bold   Regular
    Source Sans Pro Normal   Italic     msg Edge       Bold   Italic
    --------------- -------- -------    -------------- ------ -------
    Source Sans Pro Normal   Regular    msg Text       Normal Regular
    Source Sans Pro Normal   Italic     msg Text       Normal Italic
    Source Sans Pro SemiBold Regular    msg Text       Bold   Regular
    Source Sans Pro SemiBold Italic     msg Text       Bold   Italic
    --------------- -------- -------    -------------- ------ -------
    Source Sans Pro Semibold Regular    msg Head       Normal Regular
    Source Sans Pro Semibold Italic     msg Head       Normal Italic
    Source Sans Pro Bold     Regular    msg Head       Bold   Regular
    Source Sans Pro Bold     Italic     msg Head       Bold   Italic
    --------------- -------- -------    -------------- ------ -------
    Kalam           Light    Regular    msg Note       Normal Regular
    Kalam           Light    Regular    msg Note       Normal Italic
    Kalam           Normal   Regular    msg Note       Bold   Regular
    Kalam           Normal   Regular    msg Note       Bold   Italic
    --------------- -------- -------    -------------- ------ -------
    Hack            Normal   Regular    msg Code       Normal Regular
    Hack            Normal   Italic     msg Code       Normal Italic
    Hack            Bold     Regular    msg Code       Bold   Regular
    Hack            Bold     Italic     msg Code       Bold   Italic
    --------------- -------- -------    -------------- ------ -------
    Overlock        Normal   Regular    msg Deco       Normal Regular
    Overlock        Normal   Regular    msg Deco       Normal Italic
    Overlock        Bold     Italic     msg Deco       Bold   Regular
    Overlock        Bold     Italic     msg Deco       Bold   Italic
    --------------- -------- -------    -------------- ------ -------

Notice the following cruxes here:

- The "msg Text Bold" intentionally uses just the semi-bold variant
  of the underlying Source Sand Pro font family, as the regular
  bold variant optically is too heavy.

- The "msg Edge Bold" intentionally equals "msg Text Normal" and "msg
  Text Bold" intentionally equals "msg Head Normal" as it is not the
  intention to provide a total of six weights with msg Edge/Text/Head.
  Instead, each one of msg Edge/Text/Head is intended for a particular,
  separate use-case and should be of the best weight in its Normal
  weight and still provide a "somewhat" bolder weight in its Bold
  weight. As a result, msg Edge/Text/Head technically consists of
  6 weights, but optically consists of just 4 weights. The second
  reason for this special mapping is that the original (and now unused)
  ExtraLight weight of Source Sans Pro is nearly unreadable on beamer
  presentations and the original (and now also unused) Black weight of
  Source Sans Pro is nearly unreadable at small sizes.

- The "msg Note" font family actually uses the font family Kalam twice:
  once for the regular style and once again for the italic style. The
  reason is that there is no suitable script font which includes both
  regular and italic style as the regular style of a script font usually
  is already "italic" or oblique.

- The "msg Note", "msg Code" and "msg Deco" fonts were manually resized
  (through manipulation of the TTF head/unitsPerEm setting) to fix the
  x-height of msg Edge/Text/Head.

- The "msg Code" font was manually compressed (through manipulation of
  the TTF hmtx/mtx/weight settings) to optically better fit "msg Text".

- The above mapping results in exactly four fonts per font family to ensure
  the resulting fonts can be easily used even in the Microsoft Office
  products where under Windows one can only choose the font family
  and then just optionally enable bold weight and/or italic style.

Results
-------

- Stage 1:<br/>
  Here we downloaded the individual source font files.

    - `msg-Fonts-1-SRC/*`:<br/>
      The downloaded font files.

    - `msg-Fonts-1-SRC-Downloads.txt`:<br/>
      The download URLs.

- Stage 2:
  Here we converted and patched the fonts according to the above preparation.

    - `msg-Fonts-2-GEN/*`:<br/>
      The patch files for changing the font files in batch.

    - `msg-Fonts-2-GEN-Conversion.sh`:<br/>
      The batch script for the conversion/preparation procedure.

- Stage 3:
  Here we provide the resulting fonts for Desktop Publishing (DTP) with
  the two usage contexts *Adobe Creative Suite* products (Photoshop,
  Illustrator, InDesign) and *Micosoft Office* products (PowerPoint,
  Word).

    - `msg-Fonts-3-DTP/*`:<br/>
      The individual resulting font files.

    - `msg-Fonts-3-DTP-Windows-System-Install.bat`,<br/>
      `msg-Fonts-3-DTP-Windows-System-Uninstall.bat`,<br/>
      `msg-Fonts-3-DTP-Windows-User-Install.bat`,<br/>
      `msg-Fonts-3-DTP-Windows-User-Uninstall.bat`,<br/>
      `msg-Fonts-3-DTP-Windows-Util.ps1`:<br/>
      The batch scripts to install/uninstall the DTP fonts under
      Windows, either locally for the current user or globally for the
      system (required administrator privileges).

    - `msg-Fonts-3-DTP-macOS-System-Install.bat`,<br/>
      `msg-Fonts-3-DTP-macOS-System-Uninstall.bat`,<br/>
      `msg-Fonts-3-DTP-macOS-User-Install.bat`,<br/>
      `msg-Fonts-3-DTP-macOS-User-Uninstall.bat`:<br/>
      The batch scripts to install/uninstall the DTP fonts under
      macOS, either locally for the current user or globally for the
      system (required administrator privileges).

    - `msg-Fonts-3-DTP-Specimen-1-refer.pptx`:<br/>
      The font specimen in PowerPoint format, referencing installed fonts.

    - `msg-Fonts-3-DTP-Specimen-2-embed.pptx`:<br/>
      The font specimen in PowerPoint format, embedding the fonts.

    - `msg-Fonts-3-DTP-Specimen-3-export.pdf`:<br/>
      The font specimen in exported PDF format.

- Stage 4:
  Here we provide the resulting fonts for the Web and the
  two usage contexts *HTML5 Single-Page-Applications* (SPA) and *Web-Sites*.

    - `msg-Fonts-4-WEB`:<br/>
      The individual resulting font files.

    - `msg-Fonts-4-WEB-Specimen-1-refer.html`:<br/>
      The font specimen in HTML format, referencing local fonts.

    - `msg-Fonts-4-WEB-Specimen-2-embed.html`:<br/>
      The font specimen in HTML format, embedding the fonts.

    - `msg-Fonts-4-WEB-Specimen-3-export.pdf`:<br/>
      The font specimen in exported PDF format.

Author
------

Dr. Ralf S. Engelschall<br/>
Director msg Research<br/>
ralf.engelschall@msg.group


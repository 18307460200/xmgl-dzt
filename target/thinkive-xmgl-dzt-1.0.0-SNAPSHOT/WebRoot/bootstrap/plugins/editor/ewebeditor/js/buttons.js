﻿/*
*######################################
* eWebEditor V10.5 - Advanced online web based WYSIWYG HTML editor.
* Copyright (c) 2003-2016 eWebSoft.com
*
* For further information go to http://www.ewebeditor.net/
* This copyright notice MUST stay intact for use.
*######################################
*/

var Buttons={"TBSep":["","","TBSep",2],"TBHandle":["","","TBHandle",2],"Space":["","","TBGen",2],"EditMenu":[1,"am.fJ(event,'edit')","Btn",0],"UnDo":[2,"","Btn",0],"ReDo":[3,"","Btn",0],"Cut":[4,"","Btn",0],"Copy":[5,"","Btn",0],"Paste":[6,"","Btn",0],"PasteText":[7,"","Btn",0],"PasteWord":[8,"","Btn",0],"Delete":[9,"","Btn",0],"RemoveFormat":[10,"","Btn",0],"SelectAll":[11,"","Btn",0],"UnSelect":[12,"","Btn",0],"FindReplace":[13,"","Btn",0],"SpellCheck":[14,"","Btn",0],"QuickFormat":[125,"","Btn",0],"FormatBrush":[130,"","Btn",0],"FontMenu":[15,"am.fJ(event,'font')","Btn",0],"Bold":[16,"","Btn",0],"Italic":[17,"","Btn",0],"UnderLine":[18,"","Btn",0],"StrikeThrough":[19,"","Btn",0],"SuperScript":[20,"","Btn",0],"SubScript":[21,"","Btn",0],"UpperCase":[22,"","Btn",0],"LowerCase":[23,"","Btn",0],"ForeColor":[24,"","Btn",0],"BackColor":[25,"","Btn",0],"Big":[26,"","Btn",0],"Small":[27,"","Btn",0],"ParagraphMenu":[28,"am.fJ(event,'paragraph')","Btn",0],"JustifyLeft":[29,"","Btn",0],"JustifyCenter":[30,"","Btn",0],"JustifyRight":[31,"","Btn",0],"JustifyFull":[32,"","Btn",0],"OrderedList":[33,"","Btn",0],"UnOrderedList":[34,"","Btn",0],"Indent":[35,"","Btn",0],"Outdent":[36,"","Btn",0],"BR":[37,"","Btn",0],"Paragraph":[38,"","Btn",0],"ParagraphAttr":[39,"","Btn",0],"TextIndent":[139,"","Btn",0],"LineHeightMenu":[140,"am.fJ(event,'lineheight')","Btn",0],"MarginBottomMenu":[141,"am.fJ(event,'marginbottom')","Btn",0],"MarginTopMenu":[142,"am.fJ(event,'margintop')","Btn",0],"ComponentMenu":[40,"am.fJ(event,'component')","Btn",0],"Image":[41,"","Btn",0],"Flash":[42,"","Btn",0],"Media":[43,"","Btn",0],"File":[44,"","Btn",0],"RemoteUpload":[45,"","Btn",0],"LocalUpload":[46,"","Btn",0],"Fieldset":[47,"","Btn",0],"Iframe":[48,"","Btn",0],"HorizontalRule":[49,"","Btn",0],"Marquee":[50,"","Btn",0],"CreateLink":[51,"","Btn",0],"Unlink":[52,"","Btn",0],"Map":[53,"","Btn",0],"Anchor":[54,"","Btn",0],"GalleryMenu":[55,"am.fJ(event,'gallery')","Btn",0],"GalleryImage":[56,"","Btn",0],"GalleryFlash":[57,"","Btn",0],"GalleryMedia":[58,"","Btn",0],"GalleryFile":[59,"","Btn",0],"ObjectMenu":[60,"am.fJ(event,'object')","Btn",0],"BgColor":[61,"","Btn",0],"BackImage":[62,"","Btn",0],"absolutePosition":[63,"","Btn",0],"zIndexBackward":[64,"","Btn",0],"zIndexForward":[65,"","Btn",0],"ShowBorders":[66,"","Btn",0],"ShowBlocks":[129,"","Btn",0],"Quote":[67,"","Btn",0],"Code":[68,"","Btn",0],"ToolMenu":[69,"am.fJ(event,'tool')","Btn",0],"Symbol":[70,"","Btn",0],"PrintBreak":[71,"","Btn",0],"Excel":[72,"","Btn",0],"Emot":[73,"","Btn",0],"EQ":[138,"","Btn",0],"Art":[75,"","Btn",0],"NowDate":[76,"","Btn",0],"NowTime":[77,"","Btn",0],"ImportWord":[78,"","Btn",0],"ImportExcel":[79,"","Btn",0],"Template":[123,"","Btn",0],"Capture":[126,"","Btn",0],"Pagination":[127,"","Btn",0],"PaginationInsert":[128,"","Btn",0],"TitleImage":[131,"","Btn",0],"ImportPPT":[133,"","Btn",0],"MathFlowEQ":[137,"","Btn",0],"WordEQ":[136,"","Btn",0],"FormMenu":[80,"am.fJ(event,'form')","Btn",0],"FormText":[81,"","Btn",0],"FormTextArea":[82,"","Btn",0],"FormRadio":[83,"","Btn",0],"FormCheckbox":[84,"","Btn",0],"FormDropdown":[85,"","Btn",0],"FormButton":[86,"","Btn",0],"TableMenu":[87,"am.fJ(event,'table')","Btn",0],"TableInsert":[88,"","Btn",0],"TableProp":[89,"","Btn",0],"TableCellProp":[90,"","Btn",0],"TableCellSplit":[91,"","Btn",0],"TableRowProp":[92,"","Btn",0],"TableRowInsertAbove":[93,"","Btn",0],"TableRowInsertBelow":[94,"","Btn",0],"TableRowMerge":[95,"","Btn",0],"TableRowSplit":[96,"","Btn",0],"TableRowDelete":[97,"","Btn",0],"TableColInsertLeft":[98,"","Btn",0],"TableColInsertRight":[99,"","Btn",0],"TableColMerge":[100,"","Btn",0],"TableColSplit":[101,"","Btn",0],"TableColDelete":[102,"","Btn",0],"TableTemplate":[143,"","Btn",0],"FileMenu":[103,"am.fJ(event,'file')","Btn",0],"Refresh":[104,"","Btn",0],"ModeCode":[105,"","Btn",0],"ModeEdit":[106,"","Btn",0],"ModeText":[107,"","Btn",0],"ModeView":[108,"","Btn",0],"SizePlus":[109,"","Btn",0],"SizeMinus":[110,"","Btn",0],"Print":[111,"","Btn",0],"ZoomMenu":[112,"am.fJ(event,'zoom')","Btn",0],"Maximize":[113,"","Btn",0],"Minimize":[114,"","Btn",0],"Save":[115,"parent.doSave()","Btn",0],"ExpandToolbar":[135,"","Btn",0],"Help":[116,"","Btn",0],"About":[117,"","Btn",0],"Site":[118,"","Btn",0],"FontSizeMenu":[121,"am.fJ(event,'fontsize')","Btn",0],"FontNameMenu":[122,"am.fJ(event,'fontname')","Btn",0],"FormatBlockMenu":[124,"am.fJ(event,'formatblock')","Btn",0],"FontName":["","exec('FontFace',this[this.selectedIndex].value)","TBGen",1],"FontSize":["","exec('FontSize',this[this.selectedIndex].value)","TBGen",1],"FormatBlock":["","exec('FormatBlock',this[this.selectedIndex].value);this.selectedIndex=0","TBGen",1],"ZoomSelect":["","exec('zoom',this[this.selectedIndex].value)","TBGen",1]}; 
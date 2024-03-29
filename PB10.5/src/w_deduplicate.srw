$PBExportHeader$w_deduplicate.srw
forward
global type w_deduplicate from window
end type
type cb_2 from commandbutton within w_deduplicate
end type
type cb_1 from commandbutton within w_deduplicate
end type
type sle_1 from singlelineedit within w_deduplicate
end type
type lb_2 from listbox within w_deduplicate
end type
type cb_deduplicate from commandbutton within w_deduplicate
end type
type lb_1 from listbox within w_deduplicate
end type
end forward

global type w_deduplicate from window
integer width = 1824
integer height = 1372
boolean titlebar = true
string title = "Deduplicate"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
lb_2 lb_2
cb_deduplicate cb_deduplicate
lb_1 lb_1
end type
global w_deduplicate w_deduplicate

on w_deduplicate.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.lb_2=create lb_2
this.cb_deduplicate=create cb_deduplicate
this.lb_1=create lb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.sle_1,&
this.lb_2,&
this.cb_deduplicate,&
this.lb_1}
end on

on w_deduplicate.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.lb_2)
destroy(this.cb_deduplicate)
destroy(this.lb_1)
end on

type cb_2 from commandbutton within w_deduplicate
integer x = 859
integer y = 1120
integer width = 197
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reset"
end type

event clicked;lb_1.reset( )
lb_2.reset( )
end event

type cb_1 from commandbutton within w_deduplicate
integer x = 667
integer y = 1120
integer width = 197
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add"
end type

event clicked;lb_1.additem( sle_1.text)

end event

type sle_1 from singlelineedit within w_deduplicate
integer x = 73
integer y = 1124
integer width = 581
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type lb_2 from listbox within w_deduplicate
integer x = 937
integer y = 40
integer width = 786
integer height = 1056
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_deduplicate from commandbutton within w_deduplicate
integer x = 1093
integer y = 1120
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "deduplicate"
end type

event clicked;Long ll_row
String ls_array[]

//Get Array
For ll_row = 1 To lb_1.TotalItems( )
	ls_array[ll_row] = lb_1.Text(ll_row)
Next

//Deduplicator
n_cst_deduplicator ln_deduplicator
ln_deduplicator = Create n_cst_deduplicator
ln_deduplicator.of_dedupe_array( ls_array)
Destroy ln_deduplicator

//Add Result Array
For ll_row = 1 To UpperBound(ls_array)
	lb_2.AddItem( ls_array[ll_row])
Next

end event

type lb_1 from listbox within w_deduplicate
integer x = 73
integer y = 40
integer width = 786
integer height = 1056
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type


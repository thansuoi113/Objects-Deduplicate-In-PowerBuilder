$PBExportHeader$n_cst_deduplicator.sru
forward
global type n_cst_deduplicator from datastore
end type
end forward

global type n_cst_deduplicator from datastore
end type
global n_cst_deduplicator n_cst_deduplicator

type variables
Protected:

String DW_SYNTAX_START
String DW_SYNTAX_END = ' name=sorter dbname="sorter") )'

end variables

forward prototypes
protected function long dedupe (ref any avalues[])
public function long of_dedupe_array (ref integer arr[])
public function long of_dedupe_array (ref long arr[])
public function long of_dedupe_array (ref string arr[])
public function long of_dedupe_array (ref double arr[])
end prototypes

protected function long dedupe (ref any avalues[]);//====================================================================
// Function: n_cst_deduplicator.dedupe()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	reference	any	avalues[]	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2020/11/26
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


If IsNull(avalues) Then Return 0
If UpperBound(avalues) < 2 Then Return 0

Long ll_dups
String ls_type, ls_dsdef, ls_err

Reset()
Choose Case ClassName(avalues[1])
	Case "long", "unsignedlong", "ulong", "int","integer", "uint","unsignedinteger","unsignedint", "double"
		ls_type = "number"
	Case "char", "character", "string"
		ls_type = "char(4000)"
	Case Else
		//excercise for the reader
		Return 0
End Choose

ls_dsdef = DW_SYNTAX_START + ls_type + DW_SYNTAX_END
If Create(ls_dsdef, ls_err) <> 1 Then Return -1

Object.sorter.Primary = avalues

SetSort("sorter A")
Sort()

SetFilter("sorter <> sorter[-1] or GetRow () = 1" )
Filter()

ll_dups = FilteredCount()

If ll_dups > 0 Then
	avalues = Object.sorter.Primary
End If

Return ll_dups

end function

public function long of_dedupe_array (ref integer arr[]);//====================================================================
// Function: n_cst_deduplicator.of_dedupe_array()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	reference	integer	arr[]	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2020/11/26
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If IsNull (arr) Then Return -1

Long ll_dups
Any temp[]

temp = arr
ll_dups = dedupe(temp)
If ll_dups  > 0 Then
	arr = temp
End If

Return ll_dups


end function

public function long of_dedupe_array (ref long arr[]);//====================================================================
// Function: n_cst_deduplicator.of_dedupe_array()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	reference	long	arr[]	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2020/11/26
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If IsNull (arr) Then Return -1

Long ll_dups
Any temp[]

temp = arr
ll_dups = dedupe(temp)
If ll_dups  > 0 Then
	arr = temp
End If

Return ll_dups


end function

public function long of_dedupe_array (ref string arr[]);//====================================================================
// Function: n_cst_deduplicator.of_dedupe_array()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	reference	string	arr[]	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2020/11/26
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If IsNull (arr) Then Return -1

Long ll_dups
Any temp[]

temp = arr
ll_dups = dedupe(temp)
If ll_dups  > 0 Then
	arr = temp
End If

Return ll_dups


end function

public function long of_dedupe_array (ref double arr[]);//====================================================================
// Function: n_cst_deduplicator.of_dedupe_array()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	reference	double	arr[]	
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2020/11/26
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If IsNull (arr) Then Return -1

Long ll_dups
Any temp[]

temp = arr
ll_dups = dedupe(temp)
If ll_dups  > 0 Then
	arr = temp
End If

Return ll_dups



end function

on n_cst_deduplicator.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_deduplicator.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;Environment le_env

GetEnvironment(le_env)

DW_SYNTAX_START = 'release ' + String(le_env.PBMajorRevision) + '; datawindow() table(column=(type='


end event


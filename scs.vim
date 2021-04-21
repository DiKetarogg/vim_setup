
syn keyword scsSystemStatement scp_program scp_procedure agent_scp_program active_agent_scp_program rrel_params rrel_operators rrel_init rrel_in rrel_out rrel_fixed rrel_assign rrel_erase nrel_goto nrel_then nrel_else scp_operator scp_operator_executable_after_one_of_previous scp_operator_executable_after_all_previous genEl genElStr3 genElStr5 sys_gen eraseEl eraseElStr3 eraseElStr5 searchElStr3 searchElStr5 eraseSetStr3 eraseSetStr5 searchSetStr3 searchSetStr5 sys_search ifType ifVarAssign ifFormCont ifCoin ifEq ifGr   sys_wait call waitReturn waitReturnSet return varAssign varErase   synchronize 

syn keyword scsFunction contAdd contSub contMul contDiv contPow contLn contSin contCos contTg contASin contACos contATg contAssign contErase  print printNl printEl  stringToUpperCase stringToLowerCase stringReplace stringEndsWith stringSlice stringSub stringLen stringSplit stringIfGr stringIfEq contConcat

syn match scsOperator "[-=]>"
syn match scsOperator "<[-=]>\="
syn match scsOperator ':'
syn match scsOperator ';;'
syn match scsOperator '\.\.\.'

syn keyword scsType rrel_scp_const rrel_scp_var nrel_scp_var_value rrel_const rrel_var rrel_node rrel_arc rrel_link rrel_common rrel_access rrel_pos rrel_neg rrel_fuz rrel_temp rrel_perm rrel_pos_const_perm rrel_set

syn match scsType 'rrel_[0-9]\+' contains=scsNumber
syn match scsType 'rrel_set_[0-9]\+' contains=scsNumber

syn keyword scsTodo TODO FIXME XXX NOTE contained

syn match scsComment "//.*$" contains=scsTodo

syn region scsComment start='/\*' end='\*/'
"----------------------------------------------------------------
" Semantics Code Programming
"----------------------------------------------------------------

syn match scsSpecial '\\[nvt]' contained

" Regular number
syn match scsNumber '\d\+' contained display

syn region scsIdentifier start='\[\(\*\)\@!' end='\]' contains=scsSpecial


hi def link scsTodo			Todo
hi def link scsType			Type
hi def link scsComment			Comment
hi def link scsSystemStatement		Statement
hi def link scsOperator			Statement
hi def link scsNumber			Constant
hi def link scsIdentifier		Identifier
hi def link scsFunction			Identifier
hi def link scsSpecial			Special

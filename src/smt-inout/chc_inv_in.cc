/// \file CHC Invariant Input Parsing
// --- Hongce Zhang (hongcez@princeton.edu)

#include <ilang/util/log.h>
#include <ilang/util/str_util.h>
#include <ilang/util/container_shortcut.h>
#include <ilang/smt-inout/chc_inv_in.h>
#include <ilang/smt-inout/chc_inv_callback_fn.h>

namespace ilang {
namespace smt {


// -------------- SmtlibInvariantParser ---------------- //

SmtlibInvariantParser::SmtlibInvariantParser(YosysSmtParser * yosys_smt_info,
  bool _flatten_datatype, bool _flatten_hierarchy) :

  parser_wrapper(new smtlib2_abstract_parser_wrapper()),
  local_var_idx(0),
  design_smt_info_ptr(yosys_smt_info),
  datatype_flattened(_flatten_datatype), hierarchy_flattened(_flatten_hierarchy),
  _bad_state(false) {
  
  ILA_NOT_NULL(yosys_smt_info);
  // the first element's address should be the outer structure's address
  ILA_ASSERT(((void *) parser_wrapper) ==  ((void *) &(parser_wrapper->parser) )  );

  if (not parser_wrapper) {
    _bad_state = true;
    ILA_ERROR << "SMT-LIB2 parser construct allocation failed!";
    return;
  }
  // the be
  smtlib2_abstract_parser_init((smtlib2_abstract_parser *)parser_wrapper,
                                 (smtlib2_context)parser_wrapper);

  smtlib2_parser_interface *pi;
  smtlib2_term_parser *tp;

  /* initialize the term parser and override virtual methods */
  pi = &(parser_wrapper->parser.parent_);
  // pi->set_logic = smtlib2_yices_parser_set_logic;
  // pi->declare_sort = smtlib2_yices_parser_declare_sort;
  // pi->declare_function = smtlib2_yices_parser_declare_function;
  // pi->define_function = smtlib2_yices_parser_define_function;
  // pi->push = smtlib2_yices_parser_push;
  // pi->pop = smtlib2_yices_parser_pop;
  // pi->assert_formula = smtlib2_yices_parser_assert_formula;
  // pi->check_sat = smtlib2_yices_parser_check_sat;
  // pi->annotate_term = smtlib2_yices_parser_annotate_term;
  // pi->set_int_option = smtlib2_yices_parser_set_int_option;
  // pi->get_unsat_core = smtlib2_yices_parser_get_unsat_core;
  // pi->get_assignment = smtlib2_yices_parser_get_assignment;
  // pi->get_value = smtlib2_yices_parser_get_value;
  // pi->make_sort = smtlib2_yices_parser_make_sort;
  // pi->make_function_sort = smtlib2_yices_parser_make_function_sort;
  // pi->make_parametric_sort = smtlib2_yices_parser_make_parametric_sort;
  // pi->define_sort = smtlib2_yices_parser_define_sort;
  // ---------------------------------------------------------
  // pi->push_let_scope = ; pop_let_scope; push_quantifier_scope; pop_quantifier_scope
  // smtlib2_term_parser_push_let_scope // handles automatically
  // smtlib2_term_parser_pop_let_scope // handles automatically
  // smtlib2_abstract_parser_push_quantifier_scope : do nothing
  // smtlib2_abstract_parser_pop_quantifier_scope : do nothing
  // 
  // forall (A ())  make_sort -- declare_variable  -- push_quantifier_scope
  //
  //
  pi->push_quantifier_scope = proxy_push_quantifier_scope;
  pi->pop_quantifier_scope  = proxy_pop_quantifier_scope;
  pi->make_sort = proxy_make_sort;
  pi->declare_variable = proxy_declare_variable;

  tp = parser_wrapper->parser.termparser_; // internal allocated already

  // call back function to apply an uninterpreted function
  // fall through case for handler (operator) 
  smtlib2_term_parser_set_function_handler(tp,
                                             proxy_mk_function);
  smtlib2_term_parser_set_number_handler(tp,
                                           proxy_mk_number);

  smtlib2_term_parser_set_handler(tp, "and", smt_to_vlg_mk_and); // you need to carry something ...
  smtlib2_term_parser_set_handler(tp, "or",  smt_to_vlg_mk_or);
  smtlib2_term_parser_set_handler(tp, "not", smt_to_vlg_mk_not);
  smtlib2_term_parser_set_handler(tp, "=>",  smt_to_vlg_mk_implies);
  smtlib2_term_parser_set_handler(tp, "=",   smt_to_vlg_mk_eq);
  smtlib2_term_parser_set_handler(tp, "ite", smt_to_vlg_mk_ite);
  smtlib2_term_parser_set_handler(tp, "xor", smt_to_vlg_mk_xor);
  smtlib2_term_parser_set_handler(tp, "nand",smt_to_vlg_mk_nand);
  // should we do this?
  smtlib2_term_parser_set_handler(tp, "true", smt_to_vlg_mk_true);
  smtlib2_term_parser_set_handler(tp, "false",smt_to_vlg_mk_false);

  smtlib2_term_parser_set_handler(tp, "concat",smt_to_vlg_mk_concat);
  smtlib2_term_parser_set_handler(tp, "bvnot", smt_to_vlg_mk_bvnot);
  smtlib2_term_parser_set_handler(tp, "bvand", smt_to_vlg_mk_bvand);
  smtlib2_term_parser_set_handler(tp, "bvnand",smt_to_vlg_mk_bvnand);
  smtlib2_term_parser_set_handler(tp, "bvor",  smt_to_vlg_mk_bvor);
  smtlib2_term_parser_set_handler(tp, "bvnor", smt_to_vlg_mk_bvnor);
  smtlib2_term_parser_set_handler(tp, "bvxor", smt_to_vlg_mk_bvxor);
  smtlib2_term_parser_set_handler(tp, "bvxnor",smt_to_vlg_mk_bvxnor);
  smtlib2_term_parser_set_handler(tp, "bvult", smt_to_vlg_mk_bvult);
  smtlib2_term_parser_set_handler(tp, "bvslt", smt_to_vlg_mk_bvslt);
  smtlib2_term_parser_set_handler(tp, "bvule", smt_to_vlg_mk_bvule);
  smtlib2_term_parser_set_handler(tp, "bvsle", smt_to_vlg_mk_bvsle);
  smtlib2_term_parser_set_handler(tp, "bvugt", smt_to_vlg_mk_bvugt);
  smtlib2_term_parser_set_handler(tp, "bvsgt", smt_to_vlg_mk_bvsgt);
  smtlib2_term_parser_set_handler(tp, "bvuge", smt_to_vlg_mk_bvuge);
  smtlib2_term_parser_set_handler(tp, "bvsge", smt_to_vlg_mk_bvsge);
  smtlib2_term_parser_set_handler(tp, "bvcomp",smt_to_vlg_mk_bvcomp);
  smtlib2_term_parser_set_handler(tp, "bvneg", smt_to_vlg_mk_bvneg);
  smtlib2_term_parser_set_handler(tp, "bvadd", smt_to_vlg_mk_bvadd);
  smtlib2_term_parser_set_handler(tp, "bvsub", smt_to_vlg_mk_bvsub);
  smtlib2_term_parser_set_handler(tp, "bvmul", smt_to_vlg_mk_bvmul);
  smtlib2_term_parser_set_handler(tp, "bvudiv",smt_to_vlg_mk_bvudiv);
  smtlib2_term_parser_set_handler(tp, "bvsdiv",smt_to_vlg_mk_bvsdiv);
  smtlib2_term_parser_set_handler(tp, "bvsmod",smt_to_vlg_mk_bvsmod);
  smtlib2_term_parser_set_handler(tp, "bvurem",smt_to_vlg_mk_bvurem);
  smtlib2_term_parser_set_handler(tp, "bvsrem",smt_to_vlg_mk_bvsrem);
  smtlib2_term_parser_set_handler(tp, "bvshl", smt_to_vlg_mk_bvshl);
  smtlib2_term_parser_set_handler(tp, "bvlshr",smt_to_vlg_mk_bvlshr);
  smtlib2_term_parser_set_handler(tp, "bvashr",smt_to_vlg_mk_bvashr);
  smtlib2_term_parser_set_handler(tp, "extract",     smt_to_vlg_mk_extract);
  smtlib2_term_parser_set_handler(tp, "bit2bool",    smt_to_vlg_mk_bit2bool);
  smtlib2_term_parser_set_handler(tp, "repeat",      smt_to_vlg_mk_repeat);
  smtlib2_term_parser_set_handler(tp, "zero_extend", smt_to_vlg_mk_zero_extend);
  smtlib2_term_parser_set_handler(tp, "sign_extend", smt_to_vlg_mk_sign_extend);
  smtlib2_term_parser_set_handler(tp, "rotate_left", smt_to_vlg_mk_rotate_left);
  smtlib2_term_parser_set_handler(tp, "rotate_right",smt_to_vlg_mk_rotate_right);
  
}


SmtlibInvariantParser::~SmtlibInvariantParser() {
  smtlib2_abstract_parser_deinit(&(parser_wrapper->parser));
  if(parser_wrapper)
    delete parser_wrapper;
}

bool SmtlibInvariantParser::bad_state_return(void) {
  ILA_ERROR_IF(_bad_state) << "SmtlibInvariantParser is in a bad state, cannot proceed.";
  return _bad_state;
} // bad_state_return


std::string SmtlibInvariantParser::get_a_new_local_var_name() {
  return "__INV_EXT_new_local_var_"+std::to_string(local_var_idx++)+"__";
}




/// call back function to handle (forall
SmtTermInfoVlgPtr SmtlibInvariantParser::push_quantifier_scope() {

}
/// call back function to handle ) of forall
SmtTermInfoVlgPtr SmtlibInvariantParser::pop_quantifier_scope() {

}
/// call back function to create a sort
var_type * SmtlibInvariantParser::make_sort(const std::string &name, const std::vector<int> &) {

}
/// call back function to create a temporary (quantified variable)
// for the flattened-datatype, this should be the same as the datatype order
// 
void SmtlibInvariantParser::declare_quantified_variable(const std::string &name, var_type * sort ) {

}
/// call back function to apply an uninterpreted function
/// fall-through case if it is not an defined op, if failed, return NULL
/// for unflattened-hierarchy: this should be the place where things are called
/// it could be directly the (pred state)
/// or (pred (pred state)) ... you need to pass the right instance name allow side
SmtTermInfoVlgPtr SmtlibInvariantParser::mk_function(
  const std::string &name, var_type * sort, 
  const std::vector<int> & idx, const std::vector<SmtTermInfoVlgPtr> & args) {

}
/// call back function to make a number term
SmtTermInfoVlgPtr SmtlibInvariantParser::mk_number(const std::string & rep, int width, int base) {
  ILA_ASSERT(width > 0) << "Unable to translate Integer!";
  char radix;
  switch(base){
    case 2: radix = 'b'; break;
    case 10: radix = 'd'; break;
    case 16: radix = 'h'; break;
    default: ILA_ASSERT(false) << "unable to handle base:" << base;
  }
  std::string vlg_expr = std::to_string(width)+"'"+radix+rep;
  std::string name = "##bv" + vlg_expr;
  if (not IN(name, term_container)) {
    term_container.insert( std::make_pair( name, 
      SmtTermInfoVerilog(
        vlg_expr , 
        var_type ( var_type::tp::BV , width, ""), 
        this ) ) );
  }
  // return the reference from the container
  return & ( term_container[name] );
} // mk_number

#include <ilang/smt-inout/smt_op.h>

#define DEFINE_OPERATOR(name) \
  SmtTermInfoVlgPtr SmtlibInvariantParser::mk_##name( \
    const std::string & symbol, var_type * sort, \
    const std::vector<int> & idx, const std::vector<SmtTermInfoVlgPtr> & args) 

DEFINE_OPERATOR(true) {
  CHECK_EMPTY_PARAM(idx,args);
  MAKE_BOOL_RESULT(std::string("1'b1"));
}

DEFINE_OPERATOR(false) {
  CHECK_EMPTY_PARAM(idx,args);
  MAKE_BOOL_RESULT(std::string("1'b0"));
}

DEFINE_OPERATOR(and) {
  CHECK_BOOL_MULTI_ARG(idx,args);
  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr,args,var_type::tp::Bool, "&&");
  MAKE_BOOL_RESULT(vlg_expr);
}

DEFINE_OPERATOR(or) {
  CHECK_BOOL_MULTI_ARG(idx,args);

  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr,args,var_type::tp::Bool, "||");
  MAKE_BOOL_RESULT(vlg_expr);
}

DEFINE_OPERATOR(not) {
  CHECK_BOOL_ONE_ARG(idx,args);
  
  std::string vlg_expr = 
   "!(" + args[0]->_translate + ")";

  MAKE_BOOL_RESULT(vlg_expr);
}

DEFINE_OPERATOR(implies) {
  CHECK_BOOL_TWO_ARG(idx,args);
  std::string vlg_expr = 
   "~(" + args[0]->_translate + ") || (" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
}

DEFINE_OPERATOR(eq) {
  ILA_ASSERT(idx.empty());
  ILA_ASSERT(args.size() == 2); // we don't require they are bv
  ILA_ASSERT(var_type::eqtype(args[0]->_type,args[1]->_type));

  std::string vlg_expr = 
   "(" + args[0]->_translate + ") == (" = args[1]->_translate + ")";
  
  MAKE_BOOL_RESULT(vlg_expr);
}
DEFINE_OPERATOR(ite) {
  ILA_ASSERT(idx.empty());
  ILA_ASSERT(args.size() == 3);
  ILA_ASSERT(args[0]->_type._type == var_type::tp::Bool);
  ILA_ASSERT(var_type::eqtype(args[1]->_type,args[2]->_type));
  ..
}
DEFINE_OPERATOR(xor) {
  CHECK_BOOL_TWO_ARG(idx,args);
  
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") ^ (" = args[1]->_translate + ")";
   
  MAKE_BOOL_RESULT(vlg_expr);
} // xor

DEFINE_OPERATOR(nand) {
  ILA_ASSERT(idx.empty());
  ILA_ASSERT(args.size() >= 2);

  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr,args,var_type::tp::Bool, "&&" );
  vlg_expr = "!(" + vlg_expr +")";

  MAKE_BOOL_RESULT(vlg_expr);
} // nand

DEFINE_OPERATOR(concat) {
  ILA_ASSERT(idx.empty());
  ILA_ASSERT(args.size() >= 2);
  for(auto && arg:args) 
    ILA_ASSERT(arg->_type._type == var_type::tp::BV);
  
}

DEFINE_OPERATOR(bvnot) {
  CHECK_BV_ONE_ARG(idx,args);
  std::string vlg_expr = 
   "~(" + args[0]->_translate + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvnot

DEFINE_OPERATOR(bvand) {
  CHECK_BV_MULTI_ARG(idx,args);
  
  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr, args,var_type::tp::BV, "&");
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvand

DEFINE_OPERATOR(bvnand) {
  CHECK_BV_MULTI_ARG(idx,args);
  
  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr, args,var_type::tp::BV, "&");
  vlg_expr += "~(" + vlg_expr + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvnand
DEFINE_OPERATOR(bvor) {
  CHECK_BV_MULTI_ARG(idx,args);
  
  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr, args,var_type::tp::BV, "|");
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvor
DEFINE_OPERATOR(bvnor) {
  CHECK_BV_MULTI_ARG(idx,args);
  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr, args,var_type::tp::BV, "|");
  vlg_expr += "~(" + vlg_expr + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvnor

DEFINE_OPERATOR(bvxor) {
  CHECK_BV_TWO_ARG(idx,args);
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") ^ (" = args[1]->_translate + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvxor

DEFINE_OPERATOR(bvxnor) {
  CHECK_BV_TWO_ARG(idx,args);  
  std::string vlg_expr = 
   "~((" + args[0]->_translate + ") ^ (" = args[1]->_translate + "))";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvxnor

DEFINE_OPERATOR(bvult) {
  CHECK_BV_COMPARE(idx,args);
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") < (" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
} // bvult
DEFINE_OPERATOR(bvslt) {
  CHECK_BV_COMPARE(idx,args);
  std::string vlg_expr = 
   "$signed(" + args[0]->_translate + ") < $signed(" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr); 
} // bvslt
DEFINE_OPERATOR(bvule) {
  CHECK_BV_COMPARE(idx,args);  
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") <= (" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
} // bvule
DEFINE_OPERATOR(bvsle) {
  CHECK_BV_COMPARE(idx,args);  
  std::string vlg_expr = 
   "$signed(" + args[0]->_translate + ") <= $signed(" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
} // bvsle
DEFINE_OPERATOR(bvugt) {
  CHECK_BV_COMPARE(idx,args);  
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") > (" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
} // bvugt

DEFINE_OPERATOR(bvsgt) {
  CHECK_BV_COMPARE(idx,args);  
  std::string vlg_expr = 
   "$signed(" + args[0]->_translate + ") > $signed(" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
} // bvsgt
DEFINE_OPERATOR(bvuge) {
  CHECK_BV_COMPARE(idx,args);  
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") >= (" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
} // bvuge

DEFINE_OPERATOR(bvsge) {
  CHECK_BV_COMPARE(idx,args);  
  std::string vlg_expr = 
   "$signed(" + args[0]->_translate + ") >= $signed(" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
} // bvsge

DEFINE_OPERATOR(bvcomp) {
  CHECK_BV_COMPARE(idx,args);  
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") == (" = args[1]->_translate + ")";
  MAKE_BOOL_RESULT(vlg_expr);
} // bvcomp

DEFINE_OPERATOR(bvneg) {
  CHECK_BV_ONE_ARG(idx,args);
  std::string vlg_expr = 
   "( ~(" + args[0]->_translate + ") + 'b1 )";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvneg
// we support a+b+c+..
DEFINE_OPERATOR(bvadd) {
  CHECK_BV_MULTI_ARG(idx,args);
  
  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr, args, var_type::tp::BV, "+");
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvadd

DEFINE_OPERATOR(bvsub) {
  CHECK_BV_TWO_ARG(idx,args);
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") - (" = args[1]->_translate + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvsub

// we support a*b*c*...
DEFINE_OPERATOR(bvmul) {
  CHECK_BV_MULTI_ARG(idx,args);
  
  std::string vlg_expr;
  MAKE_MULTI_OP(vlg_expr, args, var_type::tp::BV, "*");
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvmul

DEFINE_OPERATOR(bvudiv) {
  CHECK_BV_TWO_ARG(idx,args);
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") / (" = args[1]->_translate + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvudiv

DEFINE_OPERATOR(bvsdiv) {
  CHECK_BV_TWO_ARG(idx,args);
  std::string vlg_expr = 
   "$signed(" + args[0]->_translate + ") / $signed(" = args[1]->_translate + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
  
} // bvsdiv


DEFINE_OPERATOR(bvsmod) {
  CHECK_BV_TWO_ARG(idx,args);
  std::string vlg_expr = 
   "$signed(" + args[0]->_translate + ") % $signed(" = args[1]->_translate + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvsmod

DEFINE_OPERATOR(bvurem) {
  CHECK_BV_TWO_ARG(idx,args);
  std::string vlg_expr = 
   "(" + args[0]->_translate + ") % (" = args[1]->_translate + ")";
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
  // CHECK_BV_TWO_ARG(idx,args);
  // MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvurem

DEFINE_OPERATOR(bvsrem) {
  ILA_ASSERT(false) << "Unimplemented";
  return nullptr;

  // CHECK_BV_TWO_ARG(idx,args);
  // MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvsrem

// allow variable shift
// not requiring same width
// width the same as args[0]
DEFINE_OPERATOR(bvshl) {
  CHECK_BV_TWO_ARG_DIFF_WIDTH(idx,args);
  
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvshl

DEFINE_OPERATOR(bvlshr) {
  CHECK_BV_TWO_ARG_DIFF_WIDTH(idx,args);
  
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvlshr

DEFINE_OPERATOR(bvashr) {
  CHECK_BV_TWO_ARG_DIFF_WIDTH(idx,args);
  
  MAKE_BV_RESULT_TYPE_AS_ARG0(vlg_expr,args);
} // bvashr

DEFINE_OPERATOR(extract) {
  ILA_ASSERT(idx.size() == 2);
  ILA_ASSERT(args.size() == 1);
  ILA_ASSERT(args[0]->_type._type == var_type::tp::BV);
  
  auto left = idx[0]; auto right = idx[1];
  auto new_width = std::max(left,right) - std::min(left,right) + 1;
  ILA_ASSERT(new_width <= args[0]->_type._width);
  ILA_ASSERT(left >=0 and left < args[0]->_type._width);
  ILA_ASSERT(right >=0 and right < args[0]->_type._width);

  std::string bitslice = "[" + std::to_string(left) + ":" + std::to_string(right) + "]";
  if (left == right)
    bitslice = "[" + std::to_string(left)  + "]";

  if (S_IN("(",args[0]->_translate )) 
  { // when we cannot put in one expression
    std::string vlg_expr = 
    "(" + args[0]->_translate + ")" + bitslice;
    std::string search_name = "##bv"+std::to_string(new_width) + "_"  + vlg_expr;
    if (not IN(search_name, term_container)) {
      auto local_var = get_a_new_local_var_name();
      // here we need to put the variable
      term_container.insert( std::make_pair( search_name, 
        SmtTermInfoVerilog(
          local_var+bitslice , 
          var_type(var_type::tp::BV, new_width, ""), 
          this ) ) );
      // assign the current expression to a local var
      // and apply to it
      local_vars.insert( std::make_pair(
        local_var, SmtTermInfoVerilog(
          args[0]->_translate,
          args[0]->_type,
          args[0]->_context)));
    }
    return & ( term_container[search_name] );
  } // else 
  ILA_ASSERT(not S_IN(')', args[0]->_translate));

  std::string vlg_expr = args[0]->_translate + bitslice;
  std::string search_name = "##bv"+std::to_string(new_width) + "_"  + vlg_expr;
  if (not IN(search_name, term_container)) {
    // here we need to put the variable
    term_container.insert( std::make_pair( search_name, 
      SmtTermInfoVerilog(
        vlg_expr , 
        var_type(var_type::tp::BV, new_width, ""), 
        this ) ) );
  } // end of insert if not found
  return & ( term_container[search_name] );
} // extract

DEFINE_OPERATOR(bit2bool) {
  ILA_ASSERT(idx.size() == 1);
  ILA_ASSERT(args.size() == 1);
  ILA_ASSERT(args[0]->_type._type == var_type::tp::BV);

  auto bitidx = idx[0];
  ILA_ASSERT(bitidx >=0 and bitidx < args[0]->_type._width);
  auto bitslice = "[" + std::to_string(bitidx)  + "]";

  if (S_IN("(",args[0]->_translate )) 
  { // when we cannot put in one expression
    std::string vlg_expr = 
    "(" + args[0]->_translate + ")" + bitslice;
    std::string search_name = "##bool_"  + vlg_expr;
    if (not IN(search_name, term_container)) {
      auto local_var = get_a_new_local_var_name();
      // here we need to put the variable
      term_container.insert( std::make_pair( search_name, 
        SmtTermInfoVerilog(
          local_var+bitslice , 
          var_type(var_type::tp::Bool, 1, ""), 
          this ) ) );
      // assign the current expression to a local var
      // and apply to it
      local_vars.insert( std::make_pair(
        local_var, SmtTermInfoVerilog(
          args[0]->_translate,
          args[0]->_type,
          args[0]->_context)));
    }
    return & ( term_container[search_name] );
  } // else 
  ILA_ASSERT(not S_IN(')', args[0]->_translate));

  std::string vlg_expr = args[0]->_translate + bitslice;
  std::string search_name = "##bool_"  + vlg_expr;
  if (not IN(search_name, term_container)) {
    // here we need to put the variable
    term_container.insert( std::make_pair( search_name, 
      SmtTermInfoVerilog(
        vlg_expr , 
        var_type(var_type::tp::Bool, 1, ""), 
        this ) ) );
  } // end of insert if not found
  return & ( term_container[search_name] );
} // bit2bool


DEFINE_OPERATOR(repeat) {
  ILA_ASSERT(false) << "Unimplemented";
  return nullptr;
}
DEFINE_OPERATOR(zero_extend) {
  ILA_ASSERT(idx.size() == 1);
  ILA_ASSERT(args.size() == 1);
  ILA_ASSERT(args[0]->_type._type == var_type::tp::BV);
  
}
DEFINE_OPERATOR(sign_extend) {
  ILA_ASSERT(idx.size() == 1);
  ILA_ASSERT(args.size() == 1);
  ILA_ASSERT(args[0]->_type._type == var_type::tp::BV);
  
}
DEFINE_OPERATOR(rotate_left) {
  ILA_ASSERT(false) << "Unimplemented";
  return nullptr;
}
DEFINE_OPERATOR(rotate_right) {
  ILA_ASSERT(false) << "Unimplemented";  
  return nullptr;
}

#undef DEFINE_OPERATOR
}; // namespace smt
}; // namespace ilang

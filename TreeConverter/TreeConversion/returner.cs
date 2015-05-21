//������������ ��� ����������� �������� ��� ������ ������.

//(ssyy) 01.12.2007
//returner ���������� ��� ����������, ��� ������� visit ������ syntax_tree_visitor
//���� ������ �� ����������.
//� ���� ��������� � ��������� ���������� ������ returner.
//������ ����� ������ ���� ���������� ret_semantic ���� semantic_node.
//��� ���������� ��� ������������� � ������� ����.
//������ ��� ���� ������ � ������� returner �� ����������.
using System;

using PascalABCCompiler.TreeRealization;

namespace PascalABCCompiler.TreeConverter
{
	public class returner
	{
        private semantic_node ret_semantic;

        private syntax_tree_visitor syntax_tree_visitor;

		public returner(syntax_tree_visitor stv)
		{
            syntax_tree_visitor = stv;
		}

        public expression_node get_expression()
        {
            return ret_semantic as expression_node;
        }

        public void reset()
        {
            ret_semantic = null;
        }

		public semantic_node visit(SyntaxTree.syntax_tree_node tn)
		{
            tn.visit(syntax_tree_visitor);
            return ret_semantic;
		}

		public statement_node visit(SyntaxTree.statement st)
		{
            st.visit(syntax_tree_visitor);
            return ret_semantic as statement_node;
		}

		public expression_node visit(SyntaxTree.expression expr)
		{
            expr.visit(syntax_tree_visitor);

            /*addressed_expression ad = ret_semantic as addressed_expression;
            if (ad != null && ad.is_addressed)
            {
                if (convertion_data_and_alghoritms.check_for_constant(ad))
                    ad.is_addressed = false;
            }*/

            //�������, ��� ������ �� �������� �� ������������������, ���� � ������ ������ ���� �� ��� ������ ����� ��������� �� ���� ������ syntax_tree_visitor-�.
            base_function_call bfc = ret_semantic as base_function_call;
            if (bfc != null)
            {
                if (bfc.simple_function_node.compile_time_executor != null)
                {
                    expression_node ex = bfc.simple_function_node.compile_time_executor(bfc.location, bfc.parameters.ToArray());
                    if (ex != null)
                    {
                        return ex;
                    }
                }
            }

            return ret_semantic as expression_node;
		}

		public type_node visit(SyntaxTree.type_definition type_def)
		{
            type_def.visit(syntax_tree_visitor);
            return ret_semantic as type_node;
		}

		public addressed_expression visit(SyntaxTree.addressed_value av)
		{
            av.visit(syntax_tree_visitor);
            return ret_semantic as addressed_expression;
		}

		public void return_value(semantic_node sn)
		{
            ret_semantic = sn;
		}

        public semantic_node get_result()
        {
            return ret_semantic;
        }

	}

}
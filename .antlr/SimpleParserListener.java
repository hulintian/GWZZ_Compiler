// Generated from /home/hlt/compilers/test_anltr4/SimpleParser.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link SimpleParserParser}.
 */
public interface SimpleParserListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link SimpleParserParser#prog}.
	 * @param ctx the parse tree
	 */
	void enterProg(SimpleParserParser.ProgContext ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleParserParser#prog}.
	 * @param ctx the parse tree
	 */
	void exitProg(SimpleParserParser.ProgContext ctx);
	/**
	 * Enter a parse tree produced by {@link SimpleParserParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(SimpleParserParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link SimpleParserParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(SimpleParserParser.ExprContext ctx);
}
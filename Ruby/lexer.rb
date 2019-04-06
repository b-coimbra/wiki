
class Types
  def str expr
    []
  end
end

TYPES  = %w{int str}
TOKENS = []

def token *expr
  TOKENS << expr
end

class Parser
  class << self
    def typeError exp, type
      abort "[!] Expected #{exp[/[a|i]/] ? 'an' : 'a'} #{exp}, instead got a #{type.class.name.downcase}."
    end

    def parse type, expr
      begin
        handler = {
          'int' => [ Integer(expr), -> { typeError('integer', expr) } ],
          'str' => [ String(expr),  -> { typeError('string',  expr) } ]
        }

        handler[type]
      rescue ArgumentError => e
        # puts handler[type]
      end
    end

    def variable *expr
      name, value = expr[1], expr[2]

      expr.each do |elem|
        if TYPES.include?(elem)
          parse('int', value)
          token(elem, name, value)
        end
      end
    end
  end
end

class Lexer
  class << self
    def lex expr
      if expr.match(/(?<type>[int|str]+)\s(?<name>\w+)\s\=\s(?<expr>.*)/m) # variable declarations
        Parser.variable($~[:type], $~[:name], $~[:expr]) # token
      elsif expr.match(/\-|\+|\*|\//m)
        # TODO: mathematical expressions
      end
    end
  end
end

class Evaluator
  class << self
    def exec
      TOKENS.each do |t|
        puts t
      end
    end
  end
end

Lexer.lex("int num = 'a'")

Evaluator.exec

module Lahti
    class Lexer
        $numbers = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
        $letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
        $operators = ['0','1','2','3','4','5','6','7','8','9','@','#']
        $variables = [A=0,B=0,C=0,D=0,E=0,F=0,G=0,H=0,I=0,J=0,K=0,L=0,M=0,N=0,O=0,P=0,Q=0,R=0,S=0,T=0,U=0,V=0,W=0,X=0,Y=0,Z=0]

        attr_reader :source, :tokens #Source code & Converted into tokens

        def initialize(source)
            @source = source
            @tokens = []
            @bigPointer = 0
            @smolPointer = 0
        end

        def startTokenization
            while sourceUncompleted
                tokenize
            end

            tokens << Token.new(:eof,'',afterSourceEndLocation)
        end

        attr_accessor :bigPointer, :smolPointer

        def tokenize
            self.smolPointer += 1
            token = nil

            c = consume
        end

        def consume
            
        end
    end
end

class Project < ActiveRecord::Base
  has_many :languages
  has_many :tags
  belongs_to :user

  def recent?
    if self.pushed_at
      num_of_days = Date.today - Date.parse("#{self.pushed_at}")
      true if num_of_days.to_i < 60
    end
  end 

  POSSIBLE_LANGUAGES=['ABAP','AGS Script','ANTLR','APL','ASP','ATS','ActionScript','Ada','Agda','Alloy','Apex','AppleScript','Arc','Arduino','AspectJ','Assembly','Augeas','AutoHotkey','AutoIt','Awk','Batchfile','Bison','BlitzBasic','BlitzMax','Bluespec','Boo','Brightscript','Bro','C','C#','C++','C2hs Haskell','CLIPS','COBOL',"Cap'n Proto",'Ceylon','Chapel','Cirru','Clean','Clojure','CoffeeScript','ColdFusion','ColdFusion CFC','Common Lisp','Component Pascal','Cool','Coq','Crystal','Cuda','Cycript','Cython','D','DM','Dart','Dogescript','Dylan','E','ECL','Eiffel','Elixir','Elm','Emacs Lisp','EmberScript','Erlang','F#','FLUX','FORTRAN','Factor','Fancy','Fantom','Forth','Frege','GAMS','GAP','GAS','GDScript',  'group: ','Game Maker Language','Glyph','Gnuplot','Go','Golo','Gosu','Grace','Grammatical Framework','Groovy','Hack','Harbour','Haskell','Haxe','Hy','IDL','IGOR Pro','Idris','Inform 7','Io','Ioke','Isabelle','J','JSONiq','Java','JavaScript','Julia','KRL','Kotlin','LFE','LOLCODE','LSL','LabVIEW','Lasso','Literate Agda','Literate CoffeeScript','Literate Haskell','LiveScript','Logos','Logtalk','LookML','LoomScript','Lua','M','Makefile','Mathematica','Matlab','Max','Mercury','Mirah','Monkey','Moocode','MoonScript','Nemerle','NetLogo','Nimrod','Nit','Nix','Nu','OCaml','Objective-C','Objective-C++','Objective-J','Omgrofl','Opa','Opal','OpenCL','OpenEdge ABL','OpenSCAD','Ox','Oxygene','Oz','PAWN','PHP','Pan','Papyrus','Parrot','Pascal','Perl','Perl6','PigLatin','Pike','PogoScript','PowerShell','Processing','Prolog','Propeller Spin','Puppet','Pure Data','PureScript','Python','R','REALbasic','Racket','Ragel in Ruby Host','Rebol','Red','RobotFramework','Rouge','Ruby','Rust','SAS','SQF','Sage','Scala','Scheme','Scilab','Self','Shell','ShellSession','Shen','Slash','Smalltalk','SourcePawn','Squirrel','Standard ML','Stata','SuperCollider','Swift','SystemVerilog','TXL','Tcl','Tcsh','Thrift','Turing','TypeScript','Unified Parallel C','UnrealScript','VCL','VHDL','Vala','Verilog','VimL','Visual Basic','Volt','XC','XProc','XQuery','XSLT','Xojo','Xtend','Zephir','Zimpl','eC','fish','nesC','ooc','wisp','xBase']


end




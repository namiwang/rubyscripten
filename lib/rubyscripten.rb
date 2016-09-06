require 'bundler/setup'

require 'rcgtk/llvm'
require 'rcgtk/module'
require 'rcgtk/execution_engine'
require 'rcgtk/type'
require 'rcgtk/value'

class RubyScripten
  attr_accessor :engine

  def initialize

    RCGTK::LLVM.init(:X86)

    @module = RCGTK::Module.new('RubyScriptenJIT')
    @engine = RCGTK::JITCompiler.new(@module)

    # # IR building objects.
    # @module = RCGTK::Module.new('RubyScriptenJIT')
    # @st     = Hash.new

    # # Execution Engine
    # @engine = RCGTK::JITCompiler.new(@module)

    # # Add passes to the Function Pass Manager.
    # @module.fpm.add(:InstCombine, :Reassociate, :GVN, :CFGSimplify)
  end
end

rs = RubyScripten.new

require "protector/simple_form/form_builder"
require "protector/simple_form/version"

module Protector
  module SimpleForm
    ::SimpleForm::FormBuilder.send :include, Protector::SimpleForm::FormBuilder
  end
end

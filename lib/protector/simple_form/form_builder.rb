module Protector
  module SimpleForm
    module FormBuilder
      extend ActiveSupport::Concern
      
      included do
        alias_method :association_without_monkey_patch, :association
        def association(association, options={}, &block)
          options = options.dup
          
          # Always protect unless otherwise specified.
          options[:protect] = true unless options[:protect] == false
          
          if options[:protect] == true && @object.respond_to?(:protector_subject?) && @object.protector_subject?
            return simple_fields_for(*[association, options.delete(:collection), options].compact, &block) if block_given?
            
            reflection = find_association_reflection(association)
            raise "Association #{association.inspect} not found" unless reflection
            
            options[:collection] ||= options.fetch(:collection) do
              # Protect using the same subject as the the current object.
              reflection.klass.restrict!(@object.protector_subject).where(reflection.options[:conditions]).order(reflection.options[:order]).to_a
            end
          end
          
          association_without_monkey_patch association, options, &block
        end
      end
    end
  end
end

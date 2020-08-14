require 'ap'
require 'json'
require 'yaml'
require 'erb'

railsbytes = {
  'JS Frameworks' => {
    variable_name: 'extraIngredientsJsFrameworkSelection',
    group: 'extra-ingredients-js-framework',
    items: {
      'Stimulus.js' => {
        railsbyte_url: 'https://www.railsbytes.com/script/V33s33',
        testing_instructions_file_name: 'verify_stimulus.txt',
        description: 'A modest JavaScript framework for the HTML you already have',
        logo: 'StimulusLogo'
      },
      'Stimulus.js + Stimulus Reflex' => {
        railsbyte_url: 'https://www.railsbytes.com/script/zr4s0Y',
        testing_instructions_file_name: 'verify_sr.txt',
        description: 'Craft modern, reactive web interfaces',
        logo: 'StimulusReflexLogo'
      }
    }
  },
  'CSS Frameworks' => {
    variable_name: 'extraIngredientsCssFrameworkSelection',
    group: 'extra-ingredients-css-framework',
    items: {
      'TailwindCSS' => {
        railsbyte_url: 'https://www.railsbytes.com/script/X8BsGy',
        testing_instructions_file_name: 'verify_tailwind.txt',
        description: 'A utility-first CSS framework for rapidly building custom designs',
        logo: 'TailwindLogo'
      },
      'Bootstrap' => {
        railsbyte_url: 'https://www.railsbytes.com/script/VMys5p',
        testing_instructions_file_name: 'verify_bootstrap.txt',
        description: 'Quickly design and customize responsive mobile-first sites',
        logo: 'BootstrapLogo'
      }
    }
  },
  'Testing Frameworks' => {
    variable_name: 'extraIngredientsTestingFrameworkSelection',
    group: 'extra-ingredients-testing-framework',
    items: {
      'Minitest' => {
        railsbyte_url: '',
        testing_instructions_file_name: 'verify_minitest.txt',
        description: 'A small and incredibly fast unit testing framework',
        logo: 'DefaultLogo'
      },
      'RSpec' => {
        railsbyte_url: 'https://www.railsbytes.com/script/VD7sra',
        testing_instructions_file_name: 'verify_rspec.txt',
        description: 'Behaviour Driven Development for Ruby',
        logo: 'RSpecLogo'
      }
    }
  }
}

class ComboGenerator
  def initialize
    @railsbytes = load_railsbytes
  end
  
  def load_command_line_vue_component
    component_path = File.join(File.dirname(__FILE__), '../components/sections/CommandLine.vue') 
    component_code = open(component_path).read
    template_combos = component_code.scan(/const templateCombosToTemplateURL = ({.+}).*\/\/ TEMPLATE COMBOS END/m).flatten[0]
    
    raw_json = template_combos.gsub("'",'"')
    
    existing_combos = JSON.parse(raw_json)
  end

  def build_tree(layers, result)
    if layers[0].is_a? Array
      layers[0].each do |item| 
        build_tree([layers[1..], item].flatten(1), result)
      end
    else
      result << layers
    end
  end

  def generate_combo_keys        
    railsbyte_buckets = railsbytes.each_with_object([]) do |(section_name, section_content), result| 
      actual_railsbytes = section_content[:items].reject{|framework_name, framework_data| framework_data[:railsbyte_url] == ''}
      result << actual_railsbytes.keys
    end
    
    all_combos = railsbyte_buckets.flatten
            
    2.upto(railsbyte_buckets.size) do |combo_count|
      all_combos << railsbyte_buckets.combination(combo_count).to_a.each_with_object([]) do |combo, current_combos|
        res = []
        build_tree(combo, res)
        current_combos << res
      end
    end
    
    all_combos.flatten(2).map{|combo| Array(combo).join(':')}        
  end
  
  def build
    existing_combos = load_command_line_vue_component
    current_combo_keys = generate_combo_keys
        
    current_combo_hash = current_combo_keys.each_with_object({}) do |combo_key, result|
      result[combo_key] = existing_combos.fetch(combo_key, "Please create Railsbyte")
    end
    
    ap generate_missing_railsbyte_combos(
      current_combo_hash.select{ |combo_key, combo_value| combo_value == "Please create Railsbyte"}, 
      existing_combos
    )
        
    generate_verification_file(combo_key: 'Bootstrap:RSpec')
  end

  private

  attr_reader :railsbytes
  
  def generate_missing_railsbyte_combos(missing_combos_hash, existing_combos)
    ap missing_combos_hash
    
    missing_combos_hash.each do |combo_key, _| 
      template = ""
      extra_ingredients = combo_key.split(":")
      
      puts "="*80
      puts "Generating template for #{combo_key}\n"
      puts "="*80
      
      extra_ingredients.each do |extra_ingredient|
        template += <<~START
        puts "🛠️  Installing #{extra_ingredient}"
        run "rails app:template LOCATION='#{existing_combos[extra_ingredient]}'"
        
        START
      end
      
      puts template
      
    end  
  end
  
  def load_railsbytes
    railsbytes_path = File.join(File.dirname(__FILE__), 'railsbytes.yaml')
    
    YAML::load( File.open( railsbytes_path ) )
  end
  
  def generate_verification_file(combo_key:)
    extra_ingredients = combo_key.split(':').sort.map{|extra_ingredient_name| normalize_extra_ingredient_name(extra_ingredient_name)}
    
    verification_file_path = create_verification_file(extra_ingredients)
        
    open(verification_file_path,'w') {|f| f.puts verification_instructions(combo_key: combo_key) }
  end
  
  def verification_instructions(combo_key:)    
    verification_template = open(File.join(File.dirname(__FILE__), 'verification_template.erb')).read
    
    setup_name = combo_key
    
    extra_ingredients_setup_steps = combo_key.split(':').each_with_object([]) do |extra_ingredient, result|
      result << extra_ingredient_setup_template(extra_ingredient)
    end
    
    extra_ingredients_verification_steps = combo_key.split(':').each_with_object([]) do |extra_ingredient, result|
      result << extra_ingredient_verification_template(extra_ingredient)
    end
    
    ERB.new(verification_template).result binding    
  end
  
  def highlight_code
    # pygmentize -O full,style=monokai -f html -l rhtml -o stimulus_code.html stimulus.erb
    
  end
  
  def normalize_extra_ingredient_name(extra_ingredient_name)
    extra_ingredient_name.gsub(/[^\w]/,'')
  end
  
  def create_verification_file(extra_ingredients)
    verification_file_name = "#{extra_ingredients.join('')}Verify.vue"
    
    verification_file_path = File.join(File.dirname(__FILE__), "../components/verify/#{verification_file_name}")
    
    if(File.exists?(verification_file_path))
      puts "Skipping verification file: #{verification_file_path}"
    else
      puts "Creating verification file: #{verification_file_path}"
      open(verification_file_path,'w')
    end
    
    verification_file_path
  end
  
  def shared_common_prep_steps_template
    open(File.join(File.dirname(__FILE__), './verification_templates/shared_common_prep_steps.erb')).read
  end
  
  def extra_ingredient_setup_template(extra_ingredient)
    puts "extra_ingredient_setup for >>#{extra_ingredient}<<"
    extra_ingredient_setup_file_path = File.join(File.dirname(__FILE__), "verification_templates/extra_ingredient_setup/#{extra_ingredient}.erb")
    open(extra_ingredient_setup_file_path).read
  end
  
  def extra_ingredient_verification_template(extra_ingredient)
    puts "extra_ingredient_verification for >>#{extra_ingredient}<<"
    extra_ingredient_verification_file_path = File.join(File.dirname(__FILE__), "verification_templates/extra_ingredient_verification/#{extra_ingredient}.erb")
    open(extra_ingredient_verification_file_path).read
  end
  
  def shared_common_verification_steps_template
    open(File.join(File.dirname(__FILE__), './verification_templates/shared_common_verification_steps.erb')).read
  end
end


combo_generator = ComboGenerator.new
#ap combo_generator.generate
combo_generator.build


namespace :export do
    task foo: :environment do
      file_name = 'exported_foo.csv'
      csv_data = Foo.to_csv
   
      File.write(file_name, csv_data)
    end
  end
  
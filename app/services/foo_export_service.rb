class FooExportService

    def initialize(foos) 
      @headers = %w{name} # 要使用的屬性
      @foos = foos
    end
  
    # 執行轉換 @return [字串]
    def perform
       CSV.generate do |csv|
         @foos.each do |foo|
           csv << foo.serializable_hash.slice(@headers).values
         end
       end
    end
  
    # 呼叫轉換方法
    def self.perform(foos)
      new(foos).perform
    end
  end
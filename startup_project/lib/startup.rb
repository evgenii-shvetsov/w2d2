require "employee"
    
class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            true
        else
            false
        end
    end

    def >(another_startup)
        if self.funding > another_startup.funding
            true
        else
            false
        end
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise_error
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee_inst)
        if @salaries[employee_inst.title] > funding
            raise_error
        else
            employee_inst.pay(@salaries[employee_inst.title])
            @funding -=  @salaries[employee_inst.title]
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        salaries_num = 0
        @employees.each do |employee| 
            salaries_num += salaries[employee.title]
        end
        salaries_num / (employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(new_startup)
        @funding += new_startup.funding

        new_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end

        new_startup.employees.each do |employee|
            @employees << employee
        end

        new_startup.close

    end

end

# frozen_string_literal: true

# ComputerBuilder class
class ComputerBuilder
  def initialize
    @computer = Computer.new
  end

  def turbo(_has_turbo_cpu: true)
    @computer.motherboard.cpu = TurboCPU.new
  end

  def display(display)
    @computer.display = display
  end

  def memory_size(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writable: false)
    @computer.drives << Drive.new(:cd, 760, writable)
  end

  def add_dvd(writable: false)
    @computer.drives << Drive.new(:dvd, 4700, writable)
  end

  def add_hard_disk(size_in_mb)
    @computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end

  def respond_to_missing?(method, _include_all = true)
    p '-' * 80
    p "method name: #{method}"
    !method.to_s.start_with('add_') || super
  end

  def method_missing(name, *args)
    funcs = name.to_s.split('_')
    return super(name, *args) unless funcs.shift == 'add'

    funcs.each do |func|
      next if func == 'and'

      exec(func)
    end
  end

  def exec(method_name)
    case method_name
    when 'cd'
      add_cd
    when 'dvd'
      add_dvd
    when 'harddisk'
      add_hard_disk(100_000)
    when 'turbo'
      turbo
    end
  end

  def computer
    raise 'Not enough memory.' if @computer.motherboard.memory_size < 250
    raise 'Too many drives.' if @computer.drives.size > 4

    @computer
  end
end

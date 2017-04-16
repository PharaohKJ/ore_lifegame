# coding: utf-8
require "ore_lifegame/version"

module OreLifegame
  # Your code goes here...
  class LifeGame
    def initialize
      initialize_status
    end

    def initialize_status
      # @status = ...
    end

    def next_status
      # ....
      # @status = ....
    end
  end

  class Board
    attr_reader :cells

    def initialize(x = 10, y = 10)
      # cell を x, y だけ生成して管理を開始する
      initialize_status(x, y)
    end

    def initialize_status(x, y)
      @cells = Array.new(y) { Array.new(x) { Cell.new } }
    end

    def next_status
      # ....
      @cells.each do |cell|
        ArroundStatus.new
        cell.next_status(arround_status)
      end
    end
  end

  class Cell
    attr_reader :status
    def initialize(start_status)
      @status = start_status
    end

    def next_status(arround_status)
      if birth?(arround_status)
        birth
      elsif keep_alive?(arround_status)
        keep
      elsif depopulation?(arround_status)
        to_die
      elsif overpoppulation?(arround_status)
        to_die
      end
    end

    def keep_alive
      raise if @status.dead?
    end

    def birth
      @status = Status.status_living
    end

    def birth?(arround_status)
      @status.dead? && arround_status == 3
    end

    def keep_alive?(arround_status)
      @status.living? && (arround_status == 2 || arround_status == 3)
    end

    def depopulation?(arround_status)
      @status.living? && arround_status <= 1
    end

    def overpoppulation?(arround_status)
      @status.living? && arround_status >= 4
    end

    def to_die
      @status = Status.status_dead
    end
  end

  class ArroundStatus
    def living_count
    end

    def dead_count
    end
  end

  class Status
    STATUS_LIVING = 1 # '●'.freeze
    STATUS_DEAD   = 0 # '◯'.freeze
    def initialize(start_status = STATUS_LIVING)
      @status = start_status
    end

    def living?
      @status == STATUS_LIVING
    end

    def dead?
      @status == STATUS_DEAD
    end

    def self.status_living
      self.new(STATUS_LIVING)
    end

    def self.status_dead
      self.new(STATUS_DEAD)
    end
  end
end

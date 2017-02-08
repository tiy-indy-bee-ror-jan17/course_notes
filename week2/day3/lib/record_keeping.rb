module RecordKeeping

  def current_population
    @current_population ||= []
  end

  def pop_count
    current_population.count
  end

  def death_rate
    current_population.count(&:dead?)/pop_count.to_f
  end

end

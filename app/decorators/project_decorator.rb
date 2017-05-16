class ProjectDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  # def created_at
  #   helpers.content_tag :span, class: 'time' do
  #     object.created_at.strftime("%a %m/%d/%y")
  #   end
  # end

  def voters_for
    voters = object.voters(true)
    format_voters(voters)
  end

  def voters_against
    voters = object.voters(false)
    format_voters(voters)
  end

  private
  def format_voters(voters_array)
    if voters_array.count > 3
      "#{voters_array[0..1].join(', ')} et #{voters_array.count-2 } autres personnes"
    elsif voters_array.count == 1
      voters_array.first
    else
      "#{voters_array[0..voters_array.count-2].join(', ')} et #{voters_array.last}"
    end
  end

end

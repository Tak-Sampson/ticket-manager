module ApplicationHelper
  def format_status(status)
    status.split('_').map(&:capitalize).join(' ')
  end

  def formatted_statuses
    Ticket.statuses.entries.map{ |arr| [format_status(arr[0]), arr[1]] }
  end

  def format_tags(collection)
    str = collection.map(&:name).join(', ')
    str == '' ? '-' : str
  end

  def format_assignee(ticket)
    if ticket.assignee
      ticket.assignee.name
    else
      '-'
    end
  end

  def elapsed_time(timestamp)
    difference = (Time.zone.now - timestamp).floor
    if difference < 60
      'less than a minute'
    elsif difference < 120
      '1 minute'
    elsif difference < 3600
      "#{difference / 60} minutes"
    elsif difference < 7200
      '1 hour'
    elsif difference < 86400
      "#{difference / 3600} hours"
    elsif difference < 172800
      '1 day'
    else
      "#{difference / 86400} days"
    end  
  end
end

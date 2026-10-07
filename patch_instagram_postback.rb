path='/app/app/builders/messages/instagram/base_message_builder.rb'
source=File.read(path)

needle="    params[:content_attributes][:is_unsupported] = true if message_is_unsupported?\n    params\n  end"

replacement="    params[:content_attributes][:is_unsupported] = true if message_is_unsupported?\n\n    postback = @messaging[:postback]\n    quick_reply = @messaging.dig(:message, :quick_reply)\n\n    if postback.present?\n      params[:content_attributes][:instagram_interaction] = {\n        type: 'postback',\n        mid: postback[:mid],\n        title: postback[:title],\n        payload: postback[:payload]\n      }.compact\n    elsif quick_reply.present?\n      params[:content_attributes][:instagram_interaction] = {\n        type: 'quick_reply',\n        mid: @messaging.dig(:message, :mid),\n        title: @messaging.dig(:message, :text),\n        payload: quick_reply[:payload]\n      }.compact\n    end\n\n    params\n  end"

raise 'Instagram interaction patch marker not found' unless source.include?(needle)

File.write(path,source.sub(needle,replacement))
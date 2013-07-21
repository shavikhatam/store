class RobokassaController < ApplicationController

  include ActiveMerchant::Billing::Integrations

  skip_before_filter :verify_authenticity_token


  # Нотификации от робокассы
  def paid

    # Ищем нотификацию от Робокассы
    notification = Robokassa::Notification.new(request.raw_post, secret: ROBOKASSA_PASS_2)

    # Верна ли подпись?
    if notification.acknowledge

      # Находим заказ
      order = Order.find(notification.item_id)

      # Отмечаем как оплаченный
      order.mark_paid

      # Сообщаем робокассе, что все хорошо
      render :text => notification.success_response

    else

      # Говорим, что плохой запрос и выключаемся
      head :bad_request

    end

  end



  def success

  end


  def fail

  end


end

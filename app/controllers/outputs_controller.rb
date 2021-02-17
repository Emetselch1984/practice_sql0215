# frozen_string_literal: true

class OutputsController < ApplicationController
    include Sql
  def index

    result = Order.connection.select_all(SumSql).to_a
    @sum = result[0]['SUM(amount)']
    result2 = Order.connection.select_all(SumSql2).to_a
    @sum2 = result2[0]['SUM(amount)']
    result3 = Product.connection.select_all(AvgSql).to_a
    @avg = result3[0]['AVG(price)']
    result4 = Product.connection.select_all(MinSql).to_a
    @minPrice = result4[0]['MIN(price)']
    result5 = Product.connection.select_all(MaxSql).to_a
    @maxPrice = result5[0]['MAX(price)']
    @userCount = User.all.size
    result6 = AccessLog.connection.select_all(CountUser).to_a
    @accesslog = result6[0]['count(distinct user_id)']
      @prefectures = User.connection.select_all(PrefectureCount).to_a
  end
end

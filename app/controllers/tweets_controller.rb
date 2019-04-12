class TweetsController < ApplicationController
  def search

    # 完全一致検索が選択されているかどうかで、入ってくるパラムスのキーが異なる。
    # 完全一致検索であれば、""を検索ワードに追加。
    if params[:keyword].present? || params[:keyword_complete].present?

      @keyword = (params[:keyword].present? ? params[:keyword] : "\"#{params[:keyword_complete]}\"")

    # 最新10件のツイートを取得する
      @tweets = []
      client = set_client
      tweets = client.search(@keyword, count: 10, result_type: "recent", exclude: "retweets", lang: "en", tweet_mode: "extended")

      # 取得したツイートをモデルに渡す
      tweets.take(10).each do |item|
        tweet = Tweet.new(item[:attrs][:full_text])
        @tweets << tweet
      end

      respond_to do |format|
        format.html
        format.json { render json: @tweets }
      end
    end
  end

  private

  def set_client
    Twitter::REST::Client.new do |config|
      config.consumer_key   = Rails.application.secrets.consumer_key
      config.consumer_secret      = Rails.application.secrets.consumer_secret
      config.access_token        = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_token_secret
    end
  end
end

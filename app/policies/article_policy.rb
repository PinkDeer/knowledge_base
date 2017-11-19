class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == article.user
  end

  def destroy?
    return true if user.present? && user == article.user
  end

  def upvote?
    user.present?
  end

  def downvote?
    user.present?
  end

  private

    def article
      record
    end
end

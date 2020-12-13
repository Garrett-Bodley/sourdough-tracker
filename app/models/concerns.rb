module Concerns
  module FindBySlug
    def find_by_slug_and_user_id(slug:, user_id:)
      self.all.find{|item| item.slug == slug && item.user_id == user_id}
    end
  end
  module Slugify
    def slug
      self.name.downcase.gsub(/[~`!@#$%^&*()+=|}{\[\]'";:><,.\/]/, "").split.join("-")
    end
  end
end
module Concerns
  module FindBySlug
    def find_by_slug(slug)
      self.all.find{|item| item.slug == slug}
    end
  end
  module Slugify
    def slug
      self.name.downcase.split.join("-")
    end
  end
end
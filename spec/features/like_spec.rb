require "rails_helper"

feature "User can like a page", js: true do
  given(:user) { create(:user) }
  given!(:my_page) { create(:page, slug: "pages/hello") }
  given(:likes_count) { my_page.likes.count }

  describe "Authenticated user" do
    before do
      sign_in(user)
    end

    describe "Like page" do
      scenario "User press like" do
        visit page_path("hello")

        within("turbo-frame#likes_page_#{my_page.id}") do
          expect(page).to have_content likes_count
          click_on likes_count.to_s
          expect(page).to have_no_content(likes_count)
          expect(page).to have_content (likes_count + 1).to_s
        end
      end
    end

    describe "Unlike page" do
      given!(:likes) { create_list(:like, 5, likeable: my_page) }
      given!(:user_like) { create(:like, user: user, likeable: my_page) }
      given!(:likes_count) { my_page.likes.count }

      scenario "User press unlike" do
        visit page_path("hello")

        within("turbo-frame#likes_page_#{my_page.id}") do
          expect(page).to have_content likes_count
          click_on likes_count.to_s
          expect(page).to have_no_content(likes_count)
          expect(page).to have_content (likes_count - 1).to_s
        end
      end
    end
  end
end

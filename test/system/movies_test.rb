require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  setup do
    @movie = movies(:one)
  end

  test "visiting the index" do
    visit movies_url
    assert_selector "h1", text: "Movies"
  end

  test "creating a Movie" do
    visit movies_url
    click_on "New Movie"

    fill_in "Actor1", with: @movie.Actor1
    fill_in "Actor2", with: @movie.Actor2
    fill_in "Actor3", with: @movie.Actor3
    fill_in "Budget", with: @movie.Budget
    fill_in "Content", with: @movie.Content
    fill_in "Country", with: @movie.Country
    fill_in "Director", with: @movie.Director
    fill_in "Duration", with: @movie.Duration
    fill_in "Genres", with: @movie.Genres
    fill_in "Gross", with: @movie.Gross
    fill_in "Keywords", with: @movie.Keywords
    fill_in "Numreviews", with: @movie.NumReviews
    fill_in "Rating", with: @movie.Rating
    fill_in "Title", with: @movie.Title
    fill_in "Year", with: @movie.Year
    click_on "Create Movie"

    assert_text "Movie was successfully created"
    click_on "Back"
  end

  test "updating a Movie" do
    visit movies_url
    click_on "Edit", match: :first

    fill_in "Actor1", with: @movie.Actor1
    fill_in "Actor2", with: @movie.Actor2
    fill_in "Actor3", with: @movie.Actor3
    fill_in "Budget", with: @movie.Budget
    fill_in "Content", with: @movie.Content
    fill_in "Country", with: @movie.Country
    fill_in "Director", with: @movie.Director
    fill_in "Duration", with: @movie.Duration
    fill_in "Genres", with: @movie.Genres
    fill_in "Gross", with: @movie.Gross
    fill_in "Keywords", with: @movie.Keywords
    fill_in "Numreviews", with: @movie.NumReviews
    fill_in "Rating", with: @movie.Rating
    fill_in "Title", with: @movie.Title
    fill_in "Year", with: @movie.Year
    click_on "Update Movie"

    assert_text "Movie was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie" do
    visit movies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie was successfully destroyed"
  end
end

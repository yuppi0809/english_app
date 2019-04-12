$(document).on('turbolinks:load', function(){
  completeSearchTab = $(".tabs").find(".tab")[0]
  icon = $(completeSearchTab).find(".toggle_icon")
  onOffDisplay = $(completeSearchTab).find(".on_off")
  clearTab = $(".tabs").find(".tab")[1]
  searchField = $(".search_field")

  $(completeSearchTab).on("click", function(){
    icon.toggleClass("fa-toggle-off");
    icon.toggleClass("fa-toggle-on");
    onOffDisplay.text((onOffDisplay.text() === "ON" ? "OFF" : "ON"))
  });

  $(clearTab).on("click", function(){
    searchField.val("");
  })

  $(".tweets_search_form").on("submit", function(){
    if (onOffDisplay.text() === "ON"){
      searchField.attr("name", "keyword_complete")
     }
  })
});

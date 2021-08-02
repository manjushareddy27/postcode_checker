$(document).ready(function() {

  $("#submitBtn").click( function(e){
    $('#display_message').html("");
        const postcode= $('#postCode').val();
        validatePostcode(postcode);
  });
});

function validatePostcode(postcode) {
  const params = {
      postcode: postcode
  };
  const options = {
      method: 'POST',
      body: JSON.stringify(params),
      headers: {
          'Content-Type': 'application/json'
      }
  }
  return fetch('/check', options)
    .then(response => {
      if(response.ok) {
        return response.json();
      }
      else {
        throw 'Request Failed'
      }
    })
    .then(data => {
      $('#display_message').html(data.message);
    })
    .catch(error => {
      data = {
        'status': 'Error',
        'error_message': error
      };
      $('#display_message').html(data);
    });
};

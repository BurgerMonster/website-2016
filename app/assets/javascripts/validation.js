var Validation = (function() {

  function presence(value) {
    return value ? [] : ['can\'t be blank'];
  }

  function email(value) {
    var regExp = /^[\w\d._-]+@[\w\d.-]+\.[\w\d.]+$/;

    if (!value) {
      return ['can\'t be blank'];
    } else if (!regExp.test(value)) {
      return ['is invalid'];
    }

    return [];
  }


  return {
    presence: presence,
    email: email
  }
}());

$(function() {
  var $form;
  var $inputs;
  var $submit;


  function getType($input) {
    return $input.is('textarea') ? 'text' : $input.attr('type');
  }

  function getValue($input) {
    var type = getType($input);
    var value = $input.val();

    if (type === 'text') {
      return _.replace(_.replace(value, /\s+/g, ' '), /^[\s\n\r\t]+|[\s\n\r\t]+$/g, '');
    } else if (type === 'number') {
      return _.toNumber(value);
    }
  }

  function buildIcon() {
    var element = document.createElement('span');

    element.className = 'glyphicon glyphicon-remove form-control-feedback';
    element.setAttribute('aria-hidden', 'true');

    return element;
  }

  function buildError(message) {
    var element = document.createElement('span');

    element.className = 'help-block';
    element.textContent = message;

    return element;
  }

  function addErrors($input, errors) {
    var $parent = $input.parent();
    var $children = $parent.find('span');

    $parent.addClass('has-error has-feedback');
    $children.remove();

    $parent.append(buildIcon());

    _(errors).each(function(message) {
      $parent.append(buildError(message));
    });
  }

  function removeErrors($input) {
    var $parent = $input.parent();
    var $children = $parent.find('span');

    $parent.removeClass('has-error has-feedback');
    $children.remove();
  }

  function changeHandler(event, displayErrors) {
    var $input = $(event.target);
    var isBlank = $input.val() === '';
    var isChanged = !isBlank || $input.attr('data-changed') || displayErrors;
    var value = getValue($input);
    var validators = _.split($input.attr('data-validate'), ', ');
    var errors = [];

    _(validators).each(function(validator) {
      errors = _.concat(errors, Validation[validator](value));
    });

    $input.attr('data-status', errors.length ? 'invalid' : 'valid');

    if (!isChanged) return;

    $input.attr('data-changed', 'true');
    displayErrors = errors.length && (displayErrors || !isBlank);

    if (displayErrors) {
      addErrors($input, errors);
    } else {
      removeErrors($input);
    }
  }

  function clickHandler(event) {
    var $invalidInputs = $('[data-status="invalid"]');

    if (!$invalidInputs.length) return true;

    _($invalidInputs).each(function(input) {
      changeHandler({ target: input }, true);
    });

    event.preventDefault();
    return false;
  }

  function initialize() {
    $form = $('#new_contact');

    if (!$form.length) return;

    $inputs = $('[data-validate]');
    $submit = $('[type="submit"]');

    $inputs.on('change', changeHandler);
    $submit.on('click', clickHandler);

    _($inputs).each(function(input) {
      changeHandler({ target: input });
    });
  }

  initialize();
});

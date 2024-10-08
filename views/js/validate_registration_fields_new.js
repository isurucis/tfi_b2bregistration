//const firstName = document.getElementById('firstName');

//if( firstName.value === '' ) {
//  errors.push('First Name is required');
//}

const validateForm = formSelector => {
  const formElement = document.querySelector(formSelector);

    const validationOptions = [
      {
        attribute: 'required',
        isValid: input => input.value.trim() !== '',
        errorMessage: (input, label) => `${label.textContent} is required`

      }
    ];

    const validateSingleFormGroup = formGroup => {
      const label = formGroup.querySelector('label');
      const input = formGroup.querySelector('input, textarea');
      const errorContainer = formGroup.querySelector('.error');
      const errorIcon = formGroup.querySelector('.error-icon');
      const successIcon = formGroup.querySelector('.success-icon');

      for(const option of validationOptions) {
        if(input.hasAttribute(option.attribute) && !option.isValid(input)) {
          errorContainer.textContent = option.errorMessage(input, label);
        }
      }

    };


  formElement.setAttribute('novalidate', '');

  formElement.addEventListener('submit', event => {
    event.preventDefault();
    validateAllFormGroups(formElement);
  });

  const validateAllFormGroups = formToValidate => {
    const formGroups = Array.from(formToValidate.querySelectorAll('.formGroup'));

    formGroups.forEach(formGroup => {
      validateSingleFormGroup(formGroup);
    });
  }
};


validateForm('#customer-form');


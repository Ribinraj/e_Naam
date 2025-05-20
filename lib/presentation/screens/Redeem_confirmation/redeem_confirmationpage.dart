import 'package:e_naam/core/constants.dart';

import 'package:flutter/material.dart';
import 'package:e_naam/core/colors.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final ValidatedAddressFormWidgetKey =
      GlobalKey<_ValidatedAddressFormWidgetState>();

  void _handleAddressSubmit(Map<String, String> addressData) {
    setState(() {
      isLoading = true;
    });

    // Process the order with the addressData
    // This would typically involve an API call to your backend service
    // Simulating an API call with Future.delayed
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });

      // Show success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Order Confirmed'),
          content: const Text('Your order has been successfully placed!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to order tracking or home page
                // Navigator.of(context).pushReplacementNamed('/home');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextStyles.body(
            text: 'Confirm Order',
            color: Appcolors.kwhiteColor,
            weight: FontWeight.bold),
        backgroundColor: Appcolors.kprimarycolor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shipping Address',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ValidatedAddressFormWidget(
                  key: ValidatedAddressFormWidgetKey,
                  onAddAddress: _handleAddressSubmit,
                ),
                ResponsiveSizedBox.height30,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            // Trigger validation in the form widget directly
                            final isValid = ValidatedAddressFormWidgetKey
                                .currentState!
                                .validate();
                            if (isValid) {
                              // Form is valid, proceed with order submission
                              final addressData = ValidatedAddressFormWidgetKey
                                  .currentState!
                                  .getAddressData();
                              _handleAddressSubmit(addressData);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.kprimarycolor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Confirm Order',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////
class ValidatedAddressFormWidget extends StatefulWidget {
  final Function(Map<String, String>) onAddAddress;

  const ValidatedAddressFormWidget({
    super.key,
    required this.onAddAddress,
  });

  @override
  State<ValidatedAddressFormWidget> createState() =>
      _ValidatedAddressFormWidgetState();
}

class _ValidatedAddressFormWidgetState
    extends State<ValidatedAddressFormWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // List of Indian states
  final List<String> indianStates = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Delhi',
    'Jammu and Kashmir',
    'Ladakh',
    'Lakshadweep',
    'Puducherry'
  ];

  String? selectedState;
  bool isStateDropdownOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final _focusNode = FocusNode();

  // Form validation errors
  String? nameError;
  String? addressError;
  String? cityError;
  String? stateError;
  String? postalCodeError;
  String? phoneError;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && isStateDropdownOpen) {
        _removeDropdown();
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    phoneController.dispose();
    _focusNode.dispose();
    _removeDropdown();
    super.dispose();
  }

  Map<String, String> getAddressData() {
    return {
      'name': nameController.text,
      'address': addressController.text,
      'city': cityController.text,
      'state': selectedState ?? '',
      'postalCode': postalCodeController.text,
      'phone': phoneController.text,
    };
  }

  bool validate() {
    bool isValid = true;

    // Reset all errors
    setState(() {
      nameError = null;
      addressError = null;
      cityError = null;
      stateError = null;
      postalCodeError = null;
      phoneError = null;
    });

    // Validate name
    if (nameController.text.trim().isEmpty) {
      setState(() {
        nameError = "Please enter recipient's name";
      });
      isValid = false;
    }

    // Validate address
    if (addressController.text.trim().isEmpty) {
      setState(() {
        addressError = "Please enter address";
      });
      isValid = false;
    }

    // Validate city
    if (cityController.text.trim().isEmpty) {
      setState(() {
        cityError = "Please enter city";
      });
      isValid = false;
    }

    // Validate state
    if (selectedState == null) {
      setState(() {
        stateError = "Please select state";
      });
      isValid = false;
    }

    // Validate postal code (6 digits for Indian PIN codes)
    if (postalCodeController.text.trim().isEmpty) {
      setState(() {
        postalCodeError = "Please enter postal code";
      });
      isValid = false;
    } else if (!RegExp(r'^\d{6}$').hasMatch(postalCodeController.text.trim())) {
      setState(() {
        postalCodeError = "Please enter a valid 6-digit postal code";
      });
      isValid = false;
    }

    // Validate phone number (10 digits for Indian phone numbers)
    if (phoneController.text.trim().isEmpty) {
      setState(() {
        phoneError = "Please enter phone number";
      });
      isValid = false;
    } else if (!RegExp(r'^\d{10}$').hasMatch(phoneController.text.trim())) {
      setState(() {
        phoneError = "Please enter a valid 10-digit phone number";
      });
      isValid = false;
    }

    if (isValid) {
      return true;
    }

    return false;
  }

  void _removeDropdown() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      isStateDropdownOpen = false;
      setState(() {});
    }
  }

  void _toggleDropdown() {
    if (isStateDropdownOpen) {
      _removeDropdown();
    } else {
      _focusNode.requestFocus();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      isStateDropdownOpen = true;
      setState(() {});
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width - 16, // Adjusted for padding
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0.0, 50.0),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 200, // Fixed height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: indianStates.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    title: Text(
                      indianStates[index],
                      style: const TextStyle(fontSize: 14),
                    ),
                    onTap: () {
                      setState(() {
                        selectedState = indianStates[index];
                        stateError = null; // Clear error when state is selected
                      });
                      _removeDropdown();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
          controller: nameController,
          hintText: "Recipient's name",
          errorText: nameError,
        ),
        const SizedBox(height: 15),
        _buildTextField(
          controller: addressController,
          hintText: "Address",
          errorText: addressError,
        ),
        const SizedBox(height: 15),
        _buildTextField(
          controller: cityController,
          hintText: "City",
          errorText: cityError,
        ),
        const SizedBox(height: 15),
        _buildStateField(),
        if (stateError != null)
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 4),
            child: Text(
              stateError!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        const SizedBox(height: 15),
        _buildTextField(
          controller: postalCodeController,
          hintText: "Postal code",
          keyboardType: TextInputType.number,
          errorText: postalCodeError,
        ),
        const SizedBox(height: 15),
        _buildTextField(
          controller: phoneController,
          hintText: "Phone number",
          keyboardType: TextInputType.phone,
          errorText: phoneError,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          cursorColor: Appcolors.ksecondrycolor,
          controller: controller,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          keyboardType: keyboardType,
          onChanged: (_) {
            // Clear errors when user types
            if (errorText != null) {
              setState(() {
                if (controller == nameController) nameError = null;
                if (controller == addressController) addressError = null;
                if (controller == cityController) cityError = null;
                if (controller == postalCodeController) postalCodeError = null;
                if (controller == phoneController) phoneError = null;
              });
            }
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 12,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Appcolors.kprimarycolor, width: 2),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Appcolors.kprimarycolor, width: .4),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 4),
            child: Text(
              errorText,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _buildStateField() {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Focus(
        focusNode: _focusNode,
        child: GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: stateError != null
                      ? Colors.red
                      : isStateDropdownOpen
                          ? Appcolors.kprimarycolor
                          : Appcolors.kprimarycolor,
                  width: isStateDropdownOpen || stateError != null ? 2 : .4,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedState ?? "Select State",
                  style: TextStyle(
                    color: selectedState != null
                        ? Colors.black
                        : Colors.grey.shade400,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  isStateDropdownOpen
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color:
                      stateError != null ? Colors.red : Appcolors.kprimarycolor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

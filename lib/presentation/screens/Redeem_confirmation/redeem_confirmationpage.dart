// import 'package:e_naam/core/constants.dart';
// import 'package:e_naam/data/productmodel.dart';
// import 'package:e_naam/data/redeem_requestmodel.dart';
// import 'package:e_naam/presentation/blocs/redeem_request_bloc/redeem_request_bloc.dart';
// import 'package:e_naam/presentation/screens/Screen_bottomnavigation.dart/screen_bottomnavigation.dart';
// import 'package:e_naam/widgets/custom_squrebutton.dart';

// import 'package:flutter/material.dart';
// import 'package:e_naam/core/colors.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class OrderConfirmationPage extends StatefulWidget {
//   final ProductModel product;
//   const OrderConfirmationPage({super.key, required this.product});

//   @override
//   State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
// }

// class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
//   final _formKey = GlobalKey<FormState>();

//   final ValidatedAddressFormWidgetKey =
//       GlobalKey<_ValidatedAddressFormWidgetState>();

//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: TextStyles.body(
//             text: 'Confirm Order',
//             color: Appcolors.kwhiteColor,
//             weight: FontWeight.bold),
//         backgroundColor: Appcolors.kprimarycolor,
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Shipping Address',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ValidatedAddressFormWidget(
//                   key: ValidatedAddressFormWidgetKey,
//                 ),
//                 ResponsiveSizedBox.height50,
//                 SizedBox(
//                   width: double.infinity,
//                   child: CustomSqureButton(
//                     color: Appcolors.kgreenColor,
//                     text: 'Redeem Now',
//                     ontap: () {
//                       final isValid = ValidatedAddressFormWidgetKey
//                           .currentState!
//                           .validate();
//                       if (isValid) {
//                         // // Form is valid, proceed with order submission
//                         final addressData = ValidatedAddressFormWidgetKey
//                             .currentState!
//                             .getAddressData();
//                         context.read<RedeemRequestBloc>().add(
//                             RedeeRequestButtonClickEvent(
//                                 request: RedeemRequestModel(
//                                     productId: widget.product.productId,
//                                     recipientName: addressData.,
//                                     deliveryAddress: deliveryAddress,
//                                     deliveryCity: deliveryCity,
//                                     deliveryState: deliveryState,
//                                     deliveryCountry: deliveryCountry,
//                                     deliveryPinCode: deliveryPinCode)));
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ///////////////////
// class ValidatedAddressFormWidget extends StatefulWidget {
//   const ValidatedAddressFormWidget({
//     super.key,
//   });

//   @override
//   State<ValidatedAddressFormWidget> createState() =>
//       _ValidatedAddressFormWidgetState();
// }

// class _ValidatedAddressFormWidgetState
//     extends State<ValidatedAddressFormWidget> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController postalCodeController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();

//   // List of Indian states
//   final List<String> indianStates = [
//     'Andhra Pradesh',
//     'Arunachal Pradesh',
//     'Assam',
//     'Bihar',
//     'Chhattisgarh',
//     'Goa',
//     'Gujarat',
//     'Haryana',
//     'Himachal Pradesh',
//     'Jharkhand',
//     'Karnataka',
//     'Kerala',
//     'Madhya Pradesh',
//     'Maharashtra',
//     'Manipur',
//     'Meghalaya',
//     'Mizoram',
//     'Nagaland',
//     'Odisha',
//     'Punjab',
//     'Rajasthan',
//     'Sikkim',
//     'Tamil Nadu',
//     'Telangana',
//     'Tripura',
//     'Uttar Pradesh',
//     'Uttarakhand',
//     'West Bengal',
//     'Andaman and Nicobar Islands',
//     'Chandigarh',
//     'Dadra and Nagar Haveli and Daman and Diu',
//     'Delhi',
//     'Jammu and Kashmir',
//     'Ladakh',
//     'Lakshadweep',
//     'Puducherry'
//   ];

//   String? selectedState;
//   bool isStateDropdownOpen = false;
//   final LayerLink _layerLink = LayerLink();
//   OverlayEntry? _overlayEntry;
//   final _focusNode = FocusNode();

//   // Form validation errors
//   String? nameError;
//   String? addressError;
//   String? cityError;
//   String? stateError;
//   String? postalCodeError;
//   String? phoneError;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       if (!_focusNode.hasFocus && isStateDropdownOpen) {
//         _removeDropdown();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     addressController.dispose();
//     cityController.dispose();
//     postalCodeController.dispose();
//     phoneController.dispose();
//     _focusNode.dispose();
//     _removeDropdown();
//     super.dispose();
//   }

//   Map<String, String> getAddressData() {
//     return {
//       'name': nameController.text,
//       'address': addressController.text,
//       'city': cityController.text,
//       'state': selectedState ?? '',
//       'postalCode': postalCodeController.text,
//       'phone': phoneController.text,
//     };
//   }

//   bool validate() {
//     bool isValid = true;

//     // Reset all errors
//     setState(() {
//       nameError = null;
//       addressError = null;
//       cityError = null;
//       stateError = null;
//       postalCodeError = null;
//       phoneError = null;
//     });

//     // Validate name
//     if (nameController.text.trim().isEmpty) {
//       setState(() {
//         nameError = "Please enter recipient's name";
//       });
//       isValid = false;
//     }

//     // Validate address
//     if (addressController.text.trim().isEmpty) {
//       setState(() {
//         addressError = "Please enter address";
//       });
//       isValid = false;
//     }

//     // Validate city
//     if (cityController.text.trim().isEmpty) {
//       setState(() {
//         cityError = "Please enter city";
//       });
//       isValid = false;
//     }

//     // Validate state
//     if (selectedState == null) {
//       setState(() {
//         stateError = "Please select state";
//       });
//       isValid = false;
//     }

//     // Validate postal code (6 digits for Indian PIN codes)
//     if (postalCodeController.text.trim().isEmpty) {
//       setState(() {
//         postalCodeError = "Please enter postal code";
//       });
//       isValid = false;
//     } else if (!RegExp(r'^\d{6}$').hasMatch(postalCodeController.text.trim())) {
//       setState(() {
//         postalCodeError = "Please enter a valid 6-digit postal code";
//       });
//       isValid = false;
//     }

//     // Validate phone number (10 digits for Indian phone numbers)
//     if (phoneController.text.trim().isEmpty) {
//       setState(() {
//         phoneError = "Please enter phone number";
//       });
//       isValid = false;
//     } else if (!RegExp(r'^\d{10}$').hasMatch(phoneController.text.trim())) {
//       setState(() {
//         phoneError = "Please enter a valid 10-digit phone number";
//       });
//       isValid = false;
//     }

//     if (isValid) {
//       return true;
//     }

//     return false;
//   }

//   void _removeDropdown() {
//     if (_overlayEntry != null) {
//       _overlayEntry!.remove();
//       _overlayEntry = null;
//       isStateDropdownOpen = false;
//       setState(() {});
//     }
//   }

//   void _toggleDropdown() {
//     if (isStateDropdownOpen) {
//       _removeDropdown();
//     } else {
//       _focusNode.requestFocus();
//       _overlayEntry = _createOverlayEntry();
//       Overlay.of(context).insert(_overlayEntry!);
//       isStateDropdownOpen = true;
//       setState(() {});
//     }
//   }

//   OverlayEntry _createOverlayEntry() {
//     RenderBox renderBox = context.findRenderObject() as RenderBox;
//     var size = renderBox.size;

//     return OverlayEntry(
//       builder: (context) => Positioned(
//         width: size.width - 16, // Adjusted for padding
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: const Offset(0.0, 50.0),
//           child: Material(
//             elevation: 4.0,
//             borderRadius: BorderRadius.circular(8),
//             child: Container(
//               height: 200, // Fixed height
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.grey.shade200),
//               ),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero,
//                 itemCount: indianStates.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     dense: true,
//                     title: Text(
//                       indianStates[index],
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                     onTap: () {
//                       setState(() {
//                         selectedState = indianStates[index];
//                         stateError = null; // Clear error when state is selected
//                       });
//                       _removeDropdown();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildTextField(
//           controller: nameController,
//           hintText: "Recipient's name",
//           errorText: nameError,
//         ),
//         const SizedBox(height: 15),
//         _buildTextField(
//           controller: addressController,
//           hintText: "Address",
//           errorText: addressError,
//         ),
//         const SizedBox(height: 15),
//         _buildTextField(
//           controller: cityController,
//           hintText: "City",
//           errorText: cityError,
//         ),
//         const SizedBox(height: 15),
//         _buildStateField(),
//         if (stateError != null)
//           Padding(
//             padding: const EdgeInsets.only(left: 8, top: 4),
//             child: Text(
//               stateError!,
//               style: const TextStyle(color: Colors.red, fontSize: 12),
//             ),
//           ),
//         const SizedBox(height: 15),
//         _buildTextField(
//           controller: postalCodeController,
//           hintText: "Postal code",
//           keyboardType: TextInputType.number,
//           errorText: postalCodeError,
//         ),
//         const SizedBox(height: 15),
//         _buildTextField(
//           controller: phoneController,
//           hintText: "Phone number",
//           keyboardType: TextInputType.phone,
//           errorText: phoneError,
//         ),
//       ],
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     TextInputType keyboardType = TextInputType.text,
//     String? errorText,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextField(
//           cursorColor: Appcolors.ksecondrycolor,
//           controller: controller,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Colors.black,
//           ),
//           keyboardType: keyboardType,
//           onChanged: (_) {
//             // Clear errors when user types
//             if (errorText != null) {
//               setState(() {
//                 if (controller == nameController) nameError = null;
//                 if (controller == addressController) addressError = null;
//                 if (controller == cityController) cityError = null;
//                 if (controller == postalCodeController) postalCodeError = null;
//                 if (controller == phoneController) phoneError = null;
//               });
//             }
//           },
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: TextStyle(
//               color: Colors.grey.shade400,
//               fontSize: 12,
//             ),
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//             focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Appcolors.kprimarycolor, width: 2),
//             ),
//             enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Appcolors.kprimarycolor, width: .4),
//             ),
//             errorBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.red, width: 1),
//             ),
//             focusedErrorBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.red, width: 2),
//             ),
//           ),
//         ),
//         if (errorText != null)
//           Padding(
//             padding: const EdgeInsets.only(left: 8, top: 4),
//             child: Text(
//               errorText,
//               style: const TextStyle(color: Colors.red, fontSize: 12),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildStateField() {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: Focus(
//         focusNode: _focusNode,
//         child: GestureDetector(
//           onTap: _toggleDropdown,
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: stateError != null
//                       ? Colors.red
//                       : isStateDropdownOpen
//                           ? Appcolors.kprimarycolor
//                           : Appcolors.kprimarycolor,
//                   width: isStateDropdownOpen || stateError != null ? 2 : .4,
//                 ),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   selectedState ?? "Select State",
//                   style: TextStyle(
//                     color: selectedState != null
//                         ? Colors.black
//                         : Colors.grey.shade400,
//                     fontSize: 14,
//                   ),
//                 ),
//                 Icon(
//                   isStateDropdownOpen
//                       ? Icons.arrow_drop_up
//                       : Icons.arrow_drop_down,
//                   color:
//                       stateError != null ? Colors.red : Appcolors.kprimarycolor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
///////////////////////////////
import 'package:e_naam/core/constants.dart';
import 'package:e_naam/data/productmodel.dart';
import 'package:e_naam/data/redeem_requestmodel.dart';
import 'package:e_naam/presentation/blocs/redeem_request_bloc/redeem_request_bloc.dart';

import 'package:e_naam/widgets/custom_squrebutton.dart';

import 'package:flutter/material.dart';
import 'package:e_naam/core/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationPage extends StatefulWidget {
  final ProductModel product;
  const OrderConfirmationPage({super.key, required this.product});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  
  String? selectedState;
  bool isStateDropdownOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final _focusNode = FocusNode();

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
        width: size.width - 32, // Adjusted for padding
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0.0, 50.0),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 200,
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
                
                // Name Field
                TextFormField(
                  controller: nameController,
                  cursorColor: Appcolors.ksecondrycolor,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Recipient's name",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter recipient's name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                // Address Field
                TextFormField(
                  controller: addressController,
                  cursorColor: Appcolors.ksecondrycolor,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Address",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                // City Field
                TextFormField(
                  controller: cityController,
                  cursorColor: Appcolors.ksecondrycolor,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "City",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter city";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                // State Dropdown
                CompositedTransformTarget(
                  link: _layerLink,
                  child: Focus(
                    focusNode: _focusNode,
                    child: FormField<String>(
                      validator: (value) {
                        if (selectedState == null) {
                          return "Please select state";
                        }
                        return null;
                      },
                      builder: (FormFieldState<String> state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: _toggleDropdown,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: state.hasError
                                          ? Colors.red
                                          : isStateDropdownOpen
                                              ? Appcolors.kprimarycolor
                                              : Appcolors.kprimarycolor,
                                      width: isStateDropdownOpen || state.hasError ? 2 : .4,
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
                                      color: state.hasError ? Colors.red : Appcolors.kprimarycolor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (state.hasError)
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 4),
                                child: Text(
                                  state.errorText!,
                                  style: const TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                
                // Postal Code Field
                TextFormField(
                  controller: postalCodeController,
                  cursorColor: Appcolors.ksecondrycolor,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Postal code",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter postal code";
                    }
                    if (!RegExp(r'^\d{6}$').hasMatch(value.trim())) {
                      return "Please enter a valid 6-digit postal code";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                // Phone Field
                TextFormField(
                  controller: phoneController,
                  cursorColor: Appcolors.ksecondrycolor,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter phone number";
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value.trim())) {
                      return "Please enter a valid 10-digit phone number";
                    }
                    return null;
                  },
                ),
                
                ResponsiveSizedBox.height50,
                
                // Redeem Button
                SizedBox(
                  width: double.infinity,
                  child: CustomSqureButton(
                    color: Appcolors.kgreenColor,
                    text: 'Redeem Now',
                    ontap: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with order submission
                        context.read<RedeemRequestBloc>().add(
                            RedeeRequestButtonClickEvent(
                                request: RedeemRequestModel(
                                    productId: widget.product.productId,
                                    recipientName: nameController.text.trim(),
                                    deliveryAddress: addressController.text.trim(),
                                    deliveryCity: cityController.text.trim(),
                                    deliveryState: selectedState!,
                                    deliveryCountry: "India",
                                    deliveryPinCode: postalCodeController.text.trim())));
                      }
                    },
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
import 'package:flutter/material.dart';

import '../../model/product.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    Key? key,
    required this.size,
  }) : super(key: key);

  final SizeModel size;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {

  int _quantity = 0;
  int _inventoryQuantity = 0;
  bool _canIncrement = true;
  bool _canDecrement = true;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      checkIsAvailable();
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        checkIsAvailable();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    resetState();
  }


  @override
  void didUpdateWidget(QuantitySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    resetState();
  }

  void resetState(){
    setState(() {
      _inventoryQuantity = widget.size.quantity;
      _quantity = (_inventoryQuantity > 0) ? 1 : 0;
      checkIsAvailable();
    });
  }

  void checkIsAvailable() {
    _canDecrement = _inventoryQuantity > 0;
    _canIncrement = _inventoryQuantity > _quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _canDecrement? _decrementQuantity : null,
          hoverColor: Colors.transparent,
          icon: const Icon(Icons.remove),
        ),
        Container(width: 80, alignment: Alignment.center, child: Text('$_quantity')),
        IconButton(
          onPressed: _canIncrement? _incrementQuantity : null,
          hoverColor: Colors.transparent,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

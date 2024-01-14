; For testing
;pub struct LinkedList<T> {
	;head: Ptr<Node<T>>,
	;tail: Ptr<Node<T>>,
    ;t: Ptr<T>,
	;len: usize,
;}
;hello::test(hello::test2(hh));
;LinkedList::<LinkedList<LinkedList>>::hello(hell);

;(generic_type
	;(type_identifier) @generic
    ;(type_arguments
      ;(type_identifier)? @inner
        ;(generic_type)? @other) @outer)
;(struct_item
	;(type_identifier) @generic
    ;(type_parameters
      ;(type_identifier)? @inner
        ;(generic_type)? @other) @outer)
;(call_expression
	;(identifier)? @generic
    ;(scoped_identifier)? @generic
    ;(arguments
      ;(identifier)? @inner) @outer)

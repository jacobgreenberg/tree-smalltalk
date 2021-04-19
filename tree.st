BinaryTree subclass: #Node
  instanceVariableNames: 'value left right'
  classVariableNames: ''
  poolDictionaries: ''
  category: nil !

"purpose: construct a new node, given an integer value
 input:   an integer
 return:  nothing"
!Node methodsFor: 'initializing'!
initialize: nodeValue
  value := nodeValue.
  left := nil.
  right := nil.
!

"purpose: insert a new node into a tree
 input:   an integer value
 return:  nothing"
!Node methodsFor: 'inserting'!
insert: nodeValue
  nodeValue < value
    ifTrue:
    [
      left isNil
      ifTrue: [left := Node new initialize: nodeValue]
      ifFalse: [left insert: nodeValue]
    ]
    ifFalse:
    [
      right isNil
      ifTrue: [right := Node new initialize: nodeValue]
      ifFalse: [right insert: nodeValue]
    ]
!

"purpose: perform an inorder traversal on our nodes
 input:   nothing
 return:  nothing"
!Node methodsFor: 'traversing'!
inOrder
  left notNil
    ifTrue: [left inOrder].
  self printOn: stdout.
  right notNil
    ifTrue: [right inOrder].
!

"purpose: perform a preorder traversal on our nodes
 input:   nothing
 return:  nothing"
preOrder
  self printOn: stdout.
  left notNil
    ifTrue: [left preOrder].
  right notNil
    ifTrue: [right preOrder].
!

"purpose: perform a postorder traversal on our nodes
 input:   nothing
 return:  nothing"
postOrder
  left notNil
    ifTrue: [left postOrder].
  right notNil
    ifTrue: [right postOrder].
  self printOn: stdout.
!

"purpose: print a node's value
 input:   nothing
 return:  nothing"
!Node methodsFor: 'printing'!
printOn: aStream
    value printOn: aStream.
    ' ' display.
!!

Object subclass: #BinaryTree
  instanceVariableNames: 'root'
  classVariableNames: ''
  poolDictionaries: ''
  category: nil !

"purpose: construct a new binary tree, provided we don't yet have a root node
          with value
 input:   nothing
 return:  nothing"
!BinaryTree methodsFor: 'initializing'!
initialize
  root := nil.
!

"purpose: construct a new binary tree, given a value for the root
 input:   value of node
 return:  nothing"
initialize: nodeValue
  root := Node new initialize: nodeValue.
!

"purpose: check if a tree is empty
 input:   nothing
 return:  true if empty, false otherwise"
!BinaryTree methodsFor: 'state'!
isEmpty
  ^root isNil
!

"purpose: insert a new node into the tree, given a value
 input:   value of new node to insert
 return:  nothing"
!BinaryTree methodsFor: 'inserting'!
insert: nodeValue
  self isEmpty
    ifTrue: [root := Node new initialize: nodeValue]
    ifFalse: [root insert: nodeValue]
!

"purpose: perform an inorder traversal on our tree
 input:   nothing
 return:  nothing"
!BinaryTree methodsFor: 'traversing'!
inOrder
  self isEmpty
    ifFalse: [root inOrder]
!

"purpose: perform a preorder traversal on our tree
 input:   nothing
 return:  nothing"
preOrder
  self isEmpty
    ifFalse: [root preOrder]
!

"purpose: perform a postorder traversal on our tree
 input:   nothing
 return:  nothing"
postOrder
  self isEmpty
    ifFalse: [root postOrder]
!!

"purpose: main (test the program)
 input:   nothing
 return:  nothing"
 | tree |
 tree := BinaryTree new initialize.
 tree insert: 40.
 tree insert: 30.
 tree insert: 50.
 tree insert: 20.
 tree insert: 35.
 tree insert: 55.
 tree insert: 32.
 tree insert: 37.
 tree insert: 53.
 'inOrder: ' display.
 tree inOrder.
 '' displayNl.
 'preOrder: ' display.
 tree preOrder.
 '' displayNl.
 'postOrder: ' display.
 tree postOrder.
!

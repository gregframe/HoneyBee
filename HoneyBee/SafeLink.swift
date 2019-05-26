//
//  SafeLink.swift
//  HoneyBee
//
//  Created by Alex Lynch on 7/11/18.
//  Copyright © 2018 IAM Apps. All rights reserved.
//

import Foundation

/**
* SafeLink is a representation of a `Link` which is guaranteed to non-erroring.
* The interface of SafeLink is a proper subset of the interface to `Link`. All functions in `Link`
* which are capable of introducing errors into the process chain are omitted from the interface of `SafeLink`.
* To transition from a non-erroring chain to an erroring chain use `setErrorHandler:` which returns a full `Link`.
*/
public class SafeLink<B, Performer: AsyncBlockPerformer> : SafeChainable {
	private let link: Link<B, Performer>
	
	init(_ link: Link<B, Performer>) {
		self.link = link
	}
	
	@discardableResult
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B) -> C) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B) -> Void) -> SafeLink<B, Performer> {
		return SafeLink(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B) -> () -> C) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B) -> () -> Void) -> SafeLink<B, Performer> {
		return SafeLink(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping ((() -> Void)?) -> Void) -> SafeLink<B, Performer> {
		return SafeLink(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (((C) -> Void)?) -> Void) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B, (() -> Void)?) -> Void) -> SafeLink<B, Performer> {
		return SafeLink(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B, ((C) -> Void)?) -> Void) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B) -> ((() -> Void)?) -> Void) -> SafeLink<B, Performer> {
		return SafeLink(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (@escaping () -> Void) -> Void) -> SafeLink<B, Performer> {
		return SafeLink(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B) -> (((C) -> Void)?) -> Void) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (@escaping (C) -> Void) -> Void) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B, @escaping () -> Void) -> Void) -> SafeLink<B, Performer> {
		return SafeLink(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B, @escaping (C) -> Void) -> Void) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B) -> (@escaping () -> Void) -> Void) -> SafeLink<B, Performer> {
		return SafeLink(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
	
	@discardableResult
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ function: @escaping (B) -> (@escaping (C) -> Void) -> Void) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(function), function))
	}
}

extension SafeLink {
	///Creates a new SafeLink which accesses a keypath starting at B and ending at type C and appends the link to the execution list of this Link
	public func chain<C>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, _ keyPath: KeyPath<B,C>) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.chain(file: file, line: line, functionDescription: functionDescription ?? tname(keyPath), keyPath))
	}
}

extension SafeLink {
	/// Set the execution queue for all descendant links. N.B. *this does not change the execution queue for the receiver's function.*
	/// Example
	///
	///     HoneyBee.start(on: .main) { root in
	///        root.setErrorHandlder(handleError)
	///            .chain(funcA)
	///            .setBlockPerformer(DispatchQueue.global())
	///            .chain(funcB)
	///     }
	///
	/// In the preceding example, `funcA` will run on `DispatchQueue.main` and `funcB` will run on `DispatchQueue.global()`
	///
	/// - Parameter queue: the new `DispatchQueue` for child links
	/// - Returns: the receiver
	@available(swift, obsoleted: 5.0, renamed: "move(to:)")
	public func setBlockPerformer<OtherPerformer: AsyncBlockPerformer>(_ otherPerformer: OtherPerformer, file: StaticString = #file, line: UInt = #line) -> SafeLink<B, OtherPerformer> {
		return self.move(to: otherPerformer, file: file, line: line)
	}
	
	/// Returns a new link with the given AsyncBlockperformer. N.B. *this does not change the execution queue for the receiver's function.*
	/// Example
	///
	///     HoneyBee.start(on: .main) { root in
	///        root.setErrorHandlder(handleError)
	///            .chain(funcA)
	///            .move(to: DispatchQueue.global())
	///            .chain(funcB)
	///     }
	///
	/// In the preceding example, `funcA` will run on `DispatchQueue.main` and `funcB` will run on `DispatchQueue.global()`
	///
	/// - Parameter otherPerformer: the new `AsyncBlockPerformer` for child link
	/// - Returns: the receiver
	public func move<OtherPerformer: AsyncBlockPerformer>(to otherPerformer: OtherPerformer, file: StaticString = #file, line: UInt = #line) -> SafeLink<B, OtherPerformer> {
		return SafeLink<B, OtherPerformer>(self.link.move(to: otherPerformer))
	}
}

extension SafeLink : ErrorHandling {
	public typealias B = B
	public typealias Performer = Performer
	
	@available(swift, obsoleted: 5.0, renamed: "handlingErrors(with:)")
	public func setErrorHandler(file: StaticString = #file, line: UInt = #line, _ errorHandler: @escaping (ErrorContext) -> Void) -> Link<B, Performer> {
		return self.link.handlingErrors(file: file, line: line, with: errorHandler)
	}
	public func handlingErrors(file: StaticString = #file, line: UInt = #line, with errorHandler: @escaping (ErrorContext) -> Void) -> Link<B, Performer> {
		return self.link.handlingErrors(file: file, line: line, with: errorHandler)
	}
}

extension SafeLink {
	// special forms
	
	/// `insert` inserts a value of any type into the chain data flow.
	///
	/// - Parameter c: Any value
	/// - Returns: a `SafeLink` whose child links will receive `c` as their function argument.
	public func insert<C>(file: StaticString = #file, line: UInt = #line, _ c: C) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.insert(file: file, line: line, c))
	}
	
	/// `drop` ignores "drops" the inbound value and returns a `SafeLink` whose value is `Void`
	///
	/// - Returns: a `SafeLink` whose child links will receive `Void` as their function argument.
	public func drop() -> SafeLink<Void, Performer> {
		return SafeLink<Void, Performer>(self.link.drop())
	}
	
	/// `tunnel` defines a subchain with whose value is ultimately discarded. The links within the `tunnel` subchain run sequentially before the link which is the return value of `tunnel`. `tunnel` returns a `SafeLink` whose execution result `B` is the result the receiver link. Thus the value `B` "hides" or "goes under ground" while the subchain processes and "pops back up" when it is completed.
	/// For example:
	///
	///      .insert(8)
	///      .tunnel { link in
	///         link.chain(intToString) //convert int to string
	///		 }
	///      .chain(multiplyInt)
	///
	/// In the example above `insert` results in an `Int` into the chain and that int is passed along to `intToString` which transform the value into a `String`.
	/// After the `tunnel` context has finished, the original value `8` (an `Int`) is passed to `multiplyInt`
	///
	/// - Parameters:
	///   - defineBlock: a block which creates a subchain to be limited.
	/// - Returns: a `SafeLink` whose execution result `R` is discarded.
	public func tunnel<R, OtherPerformer: AsyncBlockPerformer>(file: StaticString = #file, line: UInt = #line, _ defineBlock: (SafeLink<B, Performer>) -> SafeLink<R, OtherPerformer>) -> SafeLink<B, Performer> {
		return SafeLink(self.link.tunnel(file: file, line: line) { (inLink: Link<B, Performer>) -> Link<R, OtherPerformer> in
			defineBlock(SafeLink<B, Performer>(inLink)).link
		})
	}
	
	/// Yields self to a new definition block. Within the block the caller may invoke chaining methods on block multiple times, thus achieving parallel chains. Example:
	///
	///     link.branch { stem in
	///       stem.chain(func1)
	///           .chain(func2)
	///
	///       stem.chain(func3)
	///           .chain(func4)
	///     }
	///
	/// In the preceding example, when `link` is executed it will start the links containing `func1` and `func3` in parallel.
	/// `func2` will execute when `func1` is finished. Likewise `func4` will execute when `func3` is finished.
	///
	/// - Parameter defineBlock: the block to which this `SafeLink` yields itself.
	public func branch(_ defineBlock: (SafeLink<B, Performer>) -> Void) {
		self.link.branch { (inLink: Link<B, Performer>) -> Void in
			defineBlock(SafeLink(inLink))
		}
	}
	
	/// Yields self to a new definition block. Within the block the caller may invoke chaining methods on block multiple times, thus achieving parallel chains. Example:
	///
	///     link.branch { stem in
	///       let a = stem.chain(func1)
	///                   .chain(func2)
	///
	///       let b = stem.chain(func3)
	///                   .chain(func4)
	///
	///		  return (a + b) // operator for .conjoin
	///     }
	///		.chain(combine)
	///
	/// In the preceding example, when `link` is executed it will start the links containing `func1` and `func3` in parallel.
	/// `func2` will execute when `func1` is finished. Likewise `func4` will execute when `func3` is finished.
	///
	/// - Parameter defineBlock: the block to which this `SafeLink` yields itself.
	/// - Returns: The link which is returned from defineBlock
	@discardableResult
	public func branch<C>(_ defineBlock: (SafeLink<B, Performer>) -> SafeLink<C, Performer>) -> SafeLink<C, Performer> {
		return SafeLink<C, Performer>(self.link.branch { (inLink: Link<B, Performer>) -> Link<C, Performer> in
			defineBlock(SafeLink<B, Performer>(inLink)).link
		})
	}
	
	/// Yields self to a new definition block. Within the block the caller may invoke chaining methods on block multiple times, thus achieving parallel chains. Example:
	///
	///     link.branch { stem in
	///       let a = stem.chain(func1)
	///                   .chain(func2)
	///
	///       let b = stem.chain(func3)
	///                   .chain(func4)
	///
	///		  return (a + b) // operator for .conjoin
	///     }
	///		.chain(combine)
	///
	/// In the preceding example, when `link` is executed it will start the links containing `func1` and `func3` in parallel.
	/// `func2` will execute when `func1` is finished. Likewise `func4` will execute when `func3` is finished.
	///
	/// - Parameter defineBlock: the block to which this `Link` yields itself.
	/// - Returns: The link which is returned from defineBlock
	@discardableResult
	public func branch<C, OtherPerformer: AsyncBlockPerformer>(_ defineBlock: (SafeLink<B, Performer>) -> SafeLink<C, OtherPerformer>) -> SafeLink<C, OtherPerformer> {
		return defineBlock(self)
	}
	
	/// `conjoin` is a compliment to `branch`.
	/// Within the context of a `branch` it is natural and expected to create parallel execution chains.
	/// If the process definition wishes at some point to combine the results of these execution chains, then `conjoin` should be used.
	/// `conjoin` returns a `SafeLink` which waits for both the receiver and the argument `SafeLink`s created results. Those results are combined into a tuple `(B,C)` which is passed to the child links of the returned `SafeLink`
	///
	/// - Parameter other: the `SafeLink` to join with
	/// - Returns: A `SafeLink` which combines the receiver and the arguments results.
	public func conjoin<C>(_ other: SafeLink<C, Performer>) -> SafeLink<(B,C), Performer> {
		return SafeLink<(B,C), Performer>(self.link.conjoin(other.link))
	}
	
	/// `conjoin` is a compliment to `branch`.
	/// Within the context of a `branch` it is natural and expected to create parallel execution chains.
	/// If the process definition wishes at some point to combine the results of these execution chains, then `conjoin` should be used.
	/// `conjoin` returns a `SafeLink` which waits for both the receiver and the argument `SafeLink`s created results. Those results are combined into a tuple `(X, Y, C)` which is passed to the child links of the returned `SafeLink`
	///
	/// - Parameter other: the `SafeLink` to join with
	/// - Returns: A `SafeLink` which combines the receiver and the arguments results.
	public func conjoin<X,Y,C>(other: SafeLink<C, Performer>) -> SafeLink<(X,Y,C), Performer> where B == (X,Y) {
		//return SafeLink<(X,Y,C)>(self.link.conjoin(other.link)) // compiler error, Swfit 4.1
		return self.conjoin(other)
			.chain { compoundTuple -> (X,Y,C) in
				return (compoundTuple.0.0, compoundTuple.0.1, compoundTuple.1)
		}
	}
	
	/// `conjoin` is a compliment to `branch`.
	/// Within the context of a `branch` it is natural and expected to create parallel execution chains.
	/// If the process definition wishes at some point to combine the results of these execution chains, then `conjoin` should be used.
	/// `conjoin` returns a `SafeLink` which waits for both the receiver and the argument `SafeLink`s created results. Those results are combined into a tuple `(X, Y, Z, C)` which is passed to the child links of the returned `SafeLink`
	///
	/// - Parameter other: the `SafeLink` to join with
	/// - Returns: A `SafeLink` which combines the receiver and the arguments results.
	public func conjoin<X,Y,Z,C>(other: SafeLink<C, Performer>) -> SafeLink<(X,Y,Z,C), Performer> where B == (X,Y,Z) {
		return self.conjoin(other)
			.chain { compoundTuple -> (X,Y,Z,C) in
				return (compoundTuple.0.0, compoundTuple.0.1, compoundTuple.0.2, compoundTuple.1)
		}
	}
	
	/// operator syntax for `conjoin` function
	public static func +<C, CommonPerformer: AsyncBlockPerformer>(lhs: SafeLink<B, CommonPerformer>, rhs: SafeLink<C, CommonPerformer>) -> SafeLink<(B,C), CommonPerformer> {
		return lhs.conjoin(rhs)
	}
	
	/// operator syntax for `conjoin` function
	public static func +<X,Y,C, CommonPerformer: AsyncBlockPerformer>(lhs: SafeLink<B, CommonPerformer>, rhs: SafeLink<C, CommonPerformer>) -> SafeLink<(X,Y,C), CommonPerformer> where B == (X,Y) {
		return lhs.conjoin(other: rhs)
	}
	
	/// operator syntax for `conjoin` function
	public static func +<X,Y,Z,C, CommonPerformer: AsyncBlockPerformer>(lhs: SafeLink<B, CommonPerformer>, rhs: SafeLink<C, CommonPerformer>) -> SafeLink<(X,Y,Z,C), CommonPerformer> where B == (X,Y,Z) {
		return lhs.conjoin(other: rhs)
	}
	
	/// operator syntax for `join left` behavior
	///
	/// - Parameters:
	///   - lhs: SafeLink whose value to propagate
	///   - rhs: SafeLink whose value to drop
	/// - Returns: a SafeLink which contains the value of the left-hand SafeLink
	public static func <+<C, CommonPerformer: AsyncBlockPerformer>(lhs: SafeLink<B, CommonPerformer>, rhs: SafeLink<C, CommonPerformer>) -> SafeLink<B, CommonPerformer> {
		return lhs.conjoin(rhs)
			.chain { $0.0 }
	}
	
	/// operator syntax for `join right` behavior
	///
	/// - Parameters:
	///   - lhs: SafeLink whose value to drop
	///   - rhs: SafeLink whose value to propagate
	/// - Returns: a SafeLink which contains the value of the left-hand SafeLink
	public static func +><C>(lhs: SafeLink<B, Performer>, rhs: SafeLink<C, Performer>) -> SafeLink<C, Performer> {
		return lhs.conjoin(rhs)
			.chain { $0.1 }
	}
}

extension SafeLink where B : OptionalProtocol {
	/// When `B` is an `Optional` you may call `optionally`. The supplied define block creates a subchain which will be run if the Optional value is non-nil. The `SafeLink` given to the define block yields a non-optional value of `B.WrappedType` to its child links
	/// This function returns a `SafeLink` with a void result value, because the subchain defined by optionally will not be executed if `B` is `nil`.
	///
	/// - Parameter defineBlock: a block which creates a subchain to run if B is non-nil
	/// - Returns: a `SafeLink` with a void value type.
	@discardableResult
	public func optionally<X, OtherPerformer: AsyncBlockPerformer>(_ defineBlock: @escaping (SafeLink<B.WrappedType, Performer>) -> SafeLink<X, OtherPerformer>) -> SafeLink<B, Performer> {
		return SafeLink<B, Performer>(self.link.optionally({ (inLink: Link<B.WrappedType, Performer>) -> Link<X, OtherPerformer> in
			defineBlock(SafeLink<B.WrappedType, Performer>(inLink)).link
		}))
	}
}

extension SafeLink {
	/// `limit` defines a subchain with special runtime protections. The links within the `limit` subchain are guaranteed to have at most `maxParallel` parallel executions. `limit` is particularly useful in the context of a fully parallel process when part of the process must access a limited resource pool such as CPU execution contexts or network resources.
	/// This method returns a `SafeLink` whose execution result `J` is the result of the final link of the subchain. This permits the chain to proceed naturally after limit. For example:
	///
	///      .limit(5) { link in
	///         link.chain(resourceLimitedIntGenerator)
	///		}
	///     .chain(multiplyInt)
	///
	/// In the example above `resourceLimitedIntGenerator` results in an `Int` and that int is passed along to `multipyInt` after the `limit` context has finished.
	///
	/// - Parameters:
	///   - maxParallel: the maximum number of parallel executions permitted for the subchains defined by `defineBlock`
	///   - defineBlock: a block which creates a subchain to be limited.
	/// - Returns: a `SafeLink` whose execution result `J` is the result of the final link of the subchain.
	@discardableResult
	public func limit<J>(_ maxParallel: Int, _ defineBlock: (SafeLink<B, Performer>) -> SafeLink<J, Performer>) -> SafeLink<J, Performer> {
		return SafeLink<J, Performer>(self.link.limit(maxParallel, { (inLink: Link<B, Performer>) -> Link<J, Performer> in
			defineBlock(SafeLink<B, Performer>(inLink)).link
		}))
	}
	
	/// `limit` defines a subchain with special runtime protections. The links within the `limit` subchain are guaranteed to have at most `maxParallel` parallel executions. `limit` is particularly useful in the context of a fully parallel process when part of the process must access a limited resource pool such as CPU execution contexts or network resources.
	///
	/// - Parameters:
	///   - maxParallel:  the maximum number of parallel executions permitted for the subchains defined by `defineBlock`
	///   - defineBlock: a block which creates a subchain to be limited.
	public func limit(_ maxParallel: Int, _ defineBlock: (SafeLink<B, Performer>) -> Void) -> Void {
		self.link.limit(maxParallel, { (inLink: Link<B, Performer>) -> Void in
			defineBlock(SafeLink<B, Performer>(inLink))
		})
	}
}

extension SafeLink where B : Collection {
	
	/// When the inbound type is a `Collection`, you may call `map` to asynchronously map over the elements of B in parallel, transforming them with `transform` subchain.
	///
	/// - Parameter transform: the transformation subchain defining block which converts `B.Iterator.Element` to `C`
	/// - Returns: a `SafeLink` which will yield an array of `C`s to it's child links.
	public func map<C>(limit: Int? = nil, acceptableFailure: FailureRate = .none, _ transform: @escaping (SafeLink<B.Iterator.Element, Performer>) -> SafeLink<C, Performer>) -> SafeLink<[C], Performer> {
		return SafeLink<[C], Performer>(self.link.map(limit: limit, acceptableFailure: acceptableFailure) { (inLink: Link<B.Iterator.Element, Performer>) -> Link<C, Performer> in
			return transform(SafeLink<B.Iterator.Element, Performer>(inLink)).link
		})
	}
	
	/// When the inbound type is a `Collection`, you may call `filter` to asynchronously filter the elements of B in parallel, using `filter` subchain
	///
	/// - Parameter filter: the filter subchain which produces a Bool
	/// - Returns: a `SafeLink` which will yield to it's child links an array containing those `B.Iterator.Element`s which `filter` approved.
	public func filter(limit: Int? = nil, acceptableFailure: FailureRate = .none, _ filter: @escaping (SafeLink<B.Iterator.Element, Performer>) -> SafeLink<Bool, Performer>) -> SafeLink<[B.Iterator.Element], Performer> {
		return SafeLink<[B.Iterator.Element], Performer>(self.link.filter(limit: limit, acceptableFailure: acceptableFailure) { (inLink: Link<B.Iterator.Element, Performer>) -> Link<Bool, Performer> in
			return filter(SafeLink<B.Iterator.Element, Performer>(inLink)).link
		})
	}
	
	/// When the inbound type is a `Collection`, you may call `each`
	/// Each accepts a define block which creates a subchain which will be invoked once per element of the sequence.
	/// The `SafeLink` which is given as argument to the define block will pass to its child links the element of the sequence which is currently being processed.
	///
	/// - Parameter defineBlock: a block which creates a subchain for each element of the Collection
	public func each(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, limit: Int? = nil, _ defineBlock: @escaping (SafeLink<B.Element, Performer>) -> Void) -> Void {
		self.link.each(file: file, line: line, functionDescription: functionDescription, limit: limit, acceptableFailure: .none) { (inLink: Link<B.Element, Performer>) -> Void in
			defineBlock(SafeLink<B.Element, Performer>(inLink))
		}
	}
	
	/// When the inbound type is a `Collection`, you may call `each`
	/// Each accepts a define block which creates a subchain which will be invoked once per element of the sequence.
	/// The `Link` which is given as argument to the define block will pass to its child links the element of the sequence which is currently being processed.
	///
	/// - Parameter defineBlock: a block which creates a subchain for each element of the Collection
	/// - Returns: a Link which will pass the nonfailing elements of `B` to its child links
	@discardableResult
	public func each<R, OtherPerformer: AsyncBlockPerformer>(file: StaticString = #file, line: UInt = #line, functionDescription: String? = nil, limit: Int? = nil, _ defineBlock: @escaping (SafeLink<B.Element, Performer>) -> SafeLink<R, OtherPerformer>) -> SafeLink<[B.Element], Performer>  {
		return SafeLink<[B.Element], Performer>(self.link.each(file: file, line: line, functionDescription: functionDescription, limit: limit, acceptableFailure: .none) { (inLink: Link<B.Element, Performer>) -> Link<R, OtherPerformer>  in
			return defineBlock(SafeLink<B.Element, Performer>(inLink)).link
		})
	}
	
	///  When the inbound type is a `Collection`, you may call `reduce`
	///  Reduce accepts a define block which creates a subchain which will be executed *sequentially*,
	///  once per element of the sequence. The result of each successive execution of the subchain will
	///  be forwarded to the next pass of the subchain. The result of the final execution of the subchain
	///  will be forwarded to the returned link.
	///
	/// - Parameters:
	///   - t: the value to reduce onto. In many cases this value can be called an "accumulator"
	///   - acceptableFailure: the acceptable failure rate
	///   - defineBlock: a block which creates a subchain for each element of the Collection
	/// - Returns: a SafeLink which will pass the result of the reduce to its child links.
	public func reduce<T>(with t: T, acceptableFailure: FailureRate = .none, _ defineBlock: @escaping (SafeLink<(T,B.Element), Performer>) -> SafeLink<T, Performer>) -> SafeLink<T,Performer> {
		return SafeLink<T, Performer>(self.link.reduce(with: t, acceptableFailure: acceptableFailure) { (inLink: Link<(T,B.Element), Performer>) -> Link<T, Performer> in
			return defineBlock(SafeLink<(T,B.Element), Performer>(inLink)).link
		})
	}
	
	/// When the inbound type is a `Collection`, you may call `reduce`
	/// Reduce accepts a define block which creates a subchain which will be executed *in parallel*,
	/// with up to N/2 other subchains. Each subchain combines two `B.Element`s into one `B.Element`.
	/// The result of each combination is again combined until a single value remains. This value
	/// is forwarded to the returned link.
	///
	/// - Parameter defineBlock: a block which creates a subchain to combined two elements of the Collection
	/// - Returns: a SafeLink which will pass the final combined result of the reduce to its child links.
	public func reduce(_ defineBlock: @escaping (SafeLink<(B.Element,B.Element), Performer>) -> SafeLink<B.Element, Performer>) -> SafeLink<B.Element, Performer> {
		return SafeLink<B.Element, Performer>(self.link.reduce() { (inLink: Link<(B.Element,B.Element), Performer>) -> Link<B.Element, Performer> in
			return defineBlock(SafeLink<(B.Element,B.Element), Performer>(inLink)).link
		})
	}
}

extension SafeLink {
	/// Set the completion handling function for the recipe.
	/// The completion handler will be invoked exactly one time. The argument will either be the first error in the recpie or
	/// if the recipe does not error, the completion handler will be invoked with a nil argument
	/// once after the entire recipe has completed.
	///
	/// - Parameter completionHandler: a function which takes an optional error.
	/// - Returns: A `Link` which has the completion handler installed.
	public func setCompletionHandler(_ completionHandler: @escaping (Error?) -> Void ) -> Link<B, Performer> {
		return self.setCompletionHandler { (context: ErrorContext?) in
			completionHandler(context?.error)
		}
	}
	
	/// Set the completion handling function for the recipe.
	/// The completion handler will be invoked exactly one time. The argument will either be the first error in the recpie or
	/// if the recipe does not error, the completion handler will be invoked with a nil argument
	/// once after the entire recipe has completed.
	///
	/// - Parameter completionHandler: a function which takes an optional `ErrorContext`. The context contains all available debug information on the erroring function, including the error itself.
	/// - Returns: A `Link` which has the completion handler installed.
	public func setCompletionHandler(_ completionHandler: @escaping (ErrorContext?) -> Void ) -> Link<B, Performer> {
		let finallyCalled: AtomicBool = false
		let blockPerformer = HoneyBee.getBlockPerformer(of: self.link)
		return self.handlingErrors(with: { (context: ErrorContext) in
			finallyCalled.access { called in
				if !called {
					called = true
					blockPerformer.asyncPerform {
						completionHandler(context)
					}
				}
			}
		}).finally { link in
			link.chain{ (_:B, completion: @escaping ()->Void) -> Void in
				finallyCalled.access { called in
					if !called {
						blockPerformer.asyncPerform {
							completionHandler(nil)
							completion()
						}
						called = true
					} else {
						completion()
					}
				}
			}
		}
	}
}

extension SafeLink {
	internal func getBlockPerformer() -> Performer {
		return HoneyBee.getBlockPerformer(of: self.link)
	}
}


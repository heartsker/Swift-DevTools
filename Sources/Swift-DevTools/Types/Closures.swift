//
//  Closures.swift
//
//
//  Created by Daniel Pustotin on 01.09.2022.
//

public typealias Emitter<T> = () -> T
public typealias Applicator<T> = (T) -> Void
public typealias Modificator<T> = (T) -> T

public typealias VoidAction = Emitter<Void>
public typealias BoolEmitter = Emitter<Bool>

public typealias Mapper<T, U> = (T) -> U
public typealias Predicate<T> = Mapper<T, Bool>

; RUN: %opt < %s %loadEnzyme -enzyme-rust-type -print-type-analysis -type-analysis-func=callee -o /dev/null | FileCheck %s



declare void @llvm.dbg.declare(metadata, metadata, metadata)

define internal void @callee(i8* %arg) !dbg !373 {
start:
  %t = bitcast i8* %arg to [2 x [2 x [2 x float]]]*
  call void @llvm.dbg.declare(metadata [2 x [2 x [2 x float]]]* %t, metadata !384, metadata !DIExpression()), !dbg !385
  ret void
}

!llvm.module.flags = !{!14, !15, !16, !17}
!llvm.dbg.cu = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "vtable", scope: null, file: !2, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "<unknown>", directory: "")
!3 = !DICompositeType(tag: DW_TAG_structure_type, name: "vtable", file: !2, align: 64, flags: DIFlagArtificial, elements: !4, vtableHolder: !5, identifier: "vtable")
!4 = !{}
!5 = !DICompositeType(tag: DW_TAG_structure_type, name: "{closure#0}", scope: !6, file: !2, size: 64, align: 64, elements: !9, templateParams: !4, identifier: "c211ca2a5a4c8dd717d1e5fba4a6ae0")
!6 = !DINamespace(name: "lang_start", scope: !7)
!7 = !DINamespace(name: "rt", scope: !8)
!8 = !DINamespace(name: "std", scope: null)
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "main", scope: !5, file: !2, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "fn()", baseType: !12, size: 64, align: 64, dwarfAddressSpace: 0)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 2, !"RtLibUseGOT", i32 1}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = distinct !DICompileUnit(language: DW_LANG_Rust, file: !19, producer: "clang LLVM (rustc version 1.56.0 (09c42c458 2021-10-18))", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !20, globals: !37)
!19 = !DIFile(filename: "rust3darray.rs", directory: "/home/nomanous/Space/Tmp/Enzyme")
!20 = !{!21, !28}
!21 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Result", scope: !22, file: !2, baseType: !24, size: 8, align: 8, elements: !25)
!22 = !DINamespace(name: "result", scope: !23)
!23 = !DINamespace(name: "core", scope: null)
!24 = !DIBasicType(name: "u8", size: 8, encoding: DW_ATE_unsigned)
!25 = !{!26, !27}
!26 = !DIEnumerator(name: "Ok", value: 0)
!27 = !DIEnumerator(name: "Err", value: 1)
!28 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Alignment", scope: !29, file: !2, baseType: !24, size: 8, align: 8, elements: !32)
!29 = !DINamespace(name: "v1", scope: !30)
!30 = !DINamespace(name: "rt", scope: !31)
!31 = !DINamespace(name: "fmt", scope: !23)
!32 = !{!33, !34, !35, !36}
!33 = !DIEnumerator(name: "Left", value: 0)
!34 = !DIEnumerator(name: "Right", value: 1)
!35 = !DIEnumerator(name: "Center", value: 2)
!36 = !DIEnumerator(name: "Unknown", value: 3)
!37 = !{!0}
!156 = !DIBasicType(name: "f32", size: 32, encoding: DW_ATE_float)
!373 = distinct !DISubprogram(name: "callee", linkageName: "_ZN11rust3darray6callee17h37b114a70360ce19E", scope: !375, file: !374, line: 1, type: !376, scopeLine: 1, flags: DIFlagPrototyped, unit: !18, templateParams: !4, retainedNodes: !383)
!374 = !DIFile(filename: "rust3darray.rs", directory: "/home/nomanous/Space/Tmp/Enzyme", checksumkind: CSK_MD5, checksum: "adf66a1fcb26c178e41abd9c50aa582a")
!375 = !DINamespace(name: "rust3darray", scope: null)
!376 = !DISubroutineType(types: !377)
!377 = !{!156, !378}
!378 = !DICompositeType(tag: DW_TAG_array_type, baseType: !379, size: 256, align: 32, elements: !381)
!379 = !DICompositeType(tag: DW_TAG_array_type, baseType: !380, size: 128, align: 32, elements: !381)
!380 = !DICompositeType(tag: DW_TAG_array_type, baseType: !156, size: 64, align: 32, elements: !381)
!381 = !{!382}
!382 = !DISubrange(count: 2, lowerBound: 0)
!383 = !{!384}
!384 = !DILocalVariable(name: "t", arg: 1, scope: !373, file: !374, line: 1, type: !378)
!385 = !DILocation(line: 1, column: 11, scope: !373)

; CHECK: callee - {} |{[-1]:Pointer}:{} 
; CHECK-NEXT: i8* %arg: {[-1]:Pointer, [-1,0]:Float@float, [-1,4]:Float@float, [-1,8]:Float@float, [-1,12]:Float@float, [-1,16]:Float@float, [-1,20]:Float@float, [-1,24]:Float@float, [-1,28]:Float@float}
; CHECK-NEXT: start
; CHECK-NEXT:   %t = bitcast i8* %arg to [2 x [2 x [2 x float]]]*: {[-1]:Pointer, [-1,0]:Float@float, [-1,4]:Float@float, [-1,8]:Float@float, [-1,12]:Float@float, [-1,16]:Float@float, [-1,20]:Float@float, [-1,24]:Float@float, [-1,28]:Float@float}
; CHECK-NEXT:   call void @llvm.dbg.declare(metadata [2 x [2 x [2 x float]]]* %t, metadata !50, metadata !DIExpression()), !dbg !51: {}
; CHECK-NEXT:   ret void: {}

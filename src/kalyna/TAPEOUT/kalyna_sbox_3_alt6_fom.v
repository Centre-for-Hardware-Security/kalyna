//SBOX 3 - Alternative 6 - First-Order Masking
module kalyna_sbox_3_alt6_fom (s1_sbox_in, s2_sbox_in, s1_sbox_out, s2_sbox_out); 

input [7:0] s1_sbox_in, s2_sbox_in; 
output [7:0] s1_sbox_out, s2_sbox_out; 

wire [7:0] s1_sbox_in, s2_sbox_in; 
wire [7:0] s1_sbox_out, s2_sbox_out; 
wire s1_n_0, s2_n_0; 
wire s1_n_1, s2_n_1; 
wire s1_n_2, s2_n_2; 
wire s1_n_3, s2_n_3; 
wire s1_n_4, s2_n_4; 
wire s1_n_5, s2_n_5; 
wire s1_n_6, s2_n_6; 
wire s1_n_7, s2_n_7; 
wire s1_n_8, s2_n_8; 
wire s1_n_9, s2_n_9; 
wire s1_n_10, s2_n_10; 
wire s1_n_11, s2_n_11; 
wire s1_n_12, s2_n_12; 
wire s1_n_13, s2_n_13; 
wire s1_n_14, s2_n_14; 
wire s1_n_15, s2_n_15; 
wire s1_n_16, s2_n_16; 
wire s1_n_17, s2_n_17; 
wire s1_n_18, s2_n_18; 
wire s1_n_19, s2_n_19; 
wire s1_n_20, s2_n_20; 
wire s1_n_21, s2_n_21; 
wire s1_n_22, s2_n_22; 
wire s1_n_23, s2_n_23; 
wire s1_n_24, s2_n_24; 
wire s1_n_25, s2_n_25; 
wire s1_n_26, s2_n_26; 
wire s1_n_27, s2_n_27; 
wire s1_n_28, s2_n_28; 
wire s1_n_29, s2_n_29; 
wire s1_n_30, s2_n_30; 
wire s1_n_31, s2_n_31; 
wire s1_n_32, s2_n_32; 
wire s1_n_33, s2_n_33; 
wire s1_n_34, s2_n_34; 
wire s1_n_35, s2_n_35; 
wire s1_n_36, s2_n_36; 
wire s1_n_37, s2_n_37; 
wire s1_n_38, s2_n_38; 
wire s1_n_39, s2_n_39; 
wire s1_n_40, s2_n_40; 
wire s1_n_41, s2_n_41; 
wire s1_n_42, s2_n_42; 
wire s1_n_43, s2_n_43; 
wire s1_n_44, s2_n_44; 
wire s1_n_45, s2_n_45; 
wire s1_n_46, s2_n_46; 
wire s1_n_47, s2_n_47; 
wire s1_n_48, s2_n_48; 
wire s1_n_49, s2_n_49; 
wire s1_n_50, s2_n_50; 
wire s1_n_51, s2_n_51; 
wire s1_n_52, s2_n_52; 
wire s1_n_53, s2_n_53; 
wire s1_n_54, s2_n_54; 
wire s1_n_55, s2_n_55; 
wire s1_n_56, s2_n_56; 
wire s1_n_57, s2_n_57; 
wire s1_n_58, s2_n_58; 
wire s1_n_59, s2_n_59; 
wire s1_n_60, s2_n_60; 
wire s1_n_61, s2_n_61; 
wire s1_n_62, s2_n_62; 
wire s1_n_63, s2_n_63; 
wire s1_n_64, s2_n_64; 
wire s1_n_65, s2_n_65; 
wire s1_n_66, s2_n_66; 
wire s1_n_67, s2_n_67; 
wire s1_n_68, s2_n_68; 
wire s1_n_69, s2_n_69; 
wire s1_n_70, s2_n_70; 
wire s1_n_71, s2_n_71; 
wire s1_n_72, s2_n_72; 
wire s1_n_73, s2_n_73; 
wire s1_n_74, s2_n_74; 
wire s1_n_75, s2_n_75; 
wire s1_n_76, s2_n_76; 
wire s1_n_77, s2_n_77; 
wire s1_n_79, s2_n_79; 
wire s1_n_80, s2_n_80; 
wire s1_n_82, s2_n_82; 
wire s1_n_83, s2_n_83; 
wire s1_n_84, s2_n_84; 
wire s1_n_85, s2_n_85; 
wire s1_n_86, s2_n_86; 
wire s1_n_87, s2_n_87; 
wire s1_n_88, s2_n_88; 
wire s1_n_89, s2_n_89; 
wire s1_n_90, s2_n_90; 
wire s1_n_91, s2_n_91; 
wire s1_n_92, s2_n_92; 
wire s1_n_93, s2_n_93; 
wire s1_n_94, s2_n_94; 
wire s1_n_95, s2_n_95; 
wire s1_n_96, s2_n_96; 
wire s1_n_97, s2_n_97; 
wire s1_n_98, s2_n_98; 
wire s1_n_99, s2_n_99; 
wire s1_n_100, s2_n_100; 
wire s1_n_101, s2_n_101; 
wire s1_n_102, s2_n_102; 
wire s1_n_103, s2_n_103; 
wire s1_n_104, s2_n_104; 
wire s1_n_105, s2_n_105; 
wire s1_n_106, s2_n_106; 
wire s1_n_107, s2_n_107; 
wire s1_n_108, s2_n_108; 
wire s1_n_109, s2_n_109; 
wire s1_n_110, s2_n_110; 
wire s1_n_111, s2_n_111; 
wire s1_n_112, s2_n_112; 
wire s1_n_113, s2_n_113; 
wire s1_n_114, s2_n_114; 
wire s1_n_115, s2_n_115; 
wire s1_n_116, s2_n_116; 
wire s1_n_117, s2_n_117; 
wire s1_n_118, s2_n_118; 
wire s1_n_119, s2_n_119; 
wire s1_n_120, s2_n_120; 
wire s1_n_121, s2_n_121; 
wire s1_n_122, s2_n_122; 
wire s1_n_123, s2_n_123; 
wire s1_n_124, s2_n_124; 
wire s1_n_125, s2_n_125; 
wire s1_n_126, s2_n_126; 
wire s1_n_127, s2_n_127; 
wire s1_n_128, s2_n_128; 
wire s1_n_129, s2_n_129; 
wire s1_n_130, s2_n_130; 
wire s1_n_131, s2_n_131; 
wire s1_n_132, s2_n_132; 
wire s1_n_133, s2_n_133; 
wire s1_n_134, s2_n_134; 
wire s1_n_135, s2_n_135; 
wire s1_n_136, s2_n_136; 
wire s1_n_137, s2_n_137; 
wire s1_n_138, s2_n_138; 
wire s1_n_139, s2_n_139; 
wire s1_n_140, s2_n_140; 
wire s1_n_141, s2_n_141; 
wire s1_n_142, s2_n_142; 
wire s1_n_143, s2_n_143; 
wire s1_n_144, s2_n_144; 
wire s1_n_145, s2_n_145; 
wire s1_n_146, s2_n_146; 
wire s1_n_147, s2_n_147; 
wire s1_n_148, s2_n_148; 
wire s1_n_149, s2_n_149; 
wire s1_n_150, s2_n_150; 
wire s1_n_151, s2_n_151; 
wire s1_n_152, s2_n_152; 
wire s1_n_153, s2_n_153; 
wire s1_n_154, s2_n_154; 
wire s1_n_155, s2_n_155; 
wire s1_n_156, s2_n_156; 
wire s1_n_157, s2_n_157; 
wire s1_n_158, s2_n_158; 
wire s1_n_159, s2_n_159; 
wire s1_n_160, s2_n_160; 
wire s1_n_161, s2_n_161; 
wire s1_n_162, s2_n_162; 
wire s1_n_163, s2_n_163; 
wire s1_n_164, s2_n_164; 
wire s1_n_165, s2_n_165; 
wire s1_n_166, s2_n_166; 
wire s1_n_167, s2_n_167; 
wire s1_n_168, s2_n_168; 
wire s1_n_169, s2_n_169; 
wire s1_n_170, s2_n_170; 
wire s1_n_171, s2_n_171; 
wire s1_n_172, s2_n_172; 
wire s1_n_173, s2_n_173; 
wire s1_n_174, s2_n_174; 
wire s1_n_175, s2_n_175; 
wire s1_n_176, s2_n_176; 
wire s1_n_177, s2_n_177; 
wire s1_n_178, s2_n_178; 
wire s1_n_179, s2_n_179; 
wire s1_n_180, s2_n_180; 
wire s1_n_181, s2_n_181; 
wire s1_n_182, s2_n_182; 
wire s1_n_183, s2_n_183; 
wire s1_n_184, s2_n_184; 
wire s1_n_185, s2_n_185; 
wire s1_n_186, s2_n_186; 
wire s1_n_187, s2_n_187; 
wire s1_n_188, s2_n_188; 
wire s1_n_189, s2_n_189; 
wire s1_n_190, s2_n_190; 
wire s1_n_191, s2_n_191; 
wire s1_n_192, s2_n_192; 
wire s1_n_193, s2_n_193; 
wire s1_n_194, s2_n_194; 
wire s1_n_195, s2_n_195; 
wire s1_n_196, s2_n_196; 
wire s1_n_197, s2_n_197; 
wire s1_n_199, s2_n_199; 
wire s1_n_200, s2_n_200; 
wire s1_n_201, s2_n_201; 
wire s1_n_202, s2_n_202; 
wire s1_n_203, s2_n_203; 
wire s1_n_204, s2_n_204; 
wire s1_n_205, s2_n_205; 
wire s1_n_206, s2_n_206; 
wire s1_n_207, s2_n_207; 
wire s1_n_208, s2_n_208; 
wire s1_n_209, s2_n_209; 
wire s1_n_210, s2_n_210; 
wire s1_n_211, s2_n_211; 
wire s1_n_212, s2_n_212; 
wire s1_n_213, s2_n_213; 
wire s1_n_214, s2_n_214; 
wire s1_n_215, s2_n_215; 
wire s1_n_216, s2_n_216; 
wire s1_n_217, s2_n_217; 
wire s1_n_218, s2_n_218; 
wire s1_n_219, s2_n_219; 
wire s1_n_220, s2_n_220; 
wire s1_n_221, s2_n_221; 
wire s1_n_222, s2_n_222; 
wire s1_n_223, s2_n_223; 
wire s1_n_224, s2_n_224; 
wire s1_n_225, s2_n_225; 
wire s1_n_226, s2_n_226; 
wire s1_n_227, s2_n_227; 
wire s1_n_228, s2_n_228; 
wire s1_n_229, s2_n_229; 
wire s1_n_230, s2_n_230; 
wire s1_n_231, s2_n_231; 
wire s1_n_232, s2_n_232; 
wire s1_n_233, s2_n_233; 
wire s1_n_234, s2_n_234; 
wire s1_n_235, s2_n_235; 
wire s1_n_236, s2_n_236; 
wire s1_n_237, s2_n_237; 
wire s1_n_238, s2_n_238; 
wire s1_n_239, s2_n_239; 
wire s1_n_240, s2_n_240; 
wire s1_n_241, s2_n_241; 
wire s1_n_242, s2_n_242; 
wire s1_n_243, s2_n_243; 
wire s1_n_244, s2_n_244; 
wire s1_n_245, s2_n_245; 
wire s1_n_246, s2_n_246; 
wire s1_n_247, s2_n_247; 
wire s1_n_248, s2_n_248; 
wire s1_n_249, s2_n_249; 
wire s1_n_250, s2_n_250; 
wire s1_n_251, s2_n_251; 
wire s1_n_252, s2_n_252; 
wire s1_n_253, s2_n_253; 
wire s1_n_254, s2_n_254; 
wire s1_n_255, s2_n_255; 
wire s1_n_256, s2_n_256; 
wire s1_n_257, s2_n_257; 
wire s1_n_258, s2_n_258; 
wire s1_n_259, s2_n_259; 
wire s1_n_260, s2_n_260; 
wire s1_n_261, s2_n_261; 
wire s1_n_262, s2_n_262; 
wire s1_n_263, s2_n_263; 
wire s1_n_264, s2_n_264; 
wire s1_n_265, s2_n_265; 
wire s1_n_266, s2_n_266; 
wire s1_n_267, s2_n_267; 
wire s1_n_268, s2_n_268; 
wire s1_n_269, s2_n_269; 
wire s1_n_270, s2_n_270; 
wire s1_n_271, s2_n_271; 
wire s1_n_272, s2_n_272; 
wire s1_n_273, s2_n_273; 
wire s1_n_274, s2_n_274; 
wire s1_n_275, s2_n_275; 
wire s1_n_276, s2_n_276; 
wire s1_n_277, s2_n_277; 
wire s1_n_278, s2_n_278; 
wire s1_n_279, s2_n_279; 
wire s1_n_280, s2_n_280; 
wire s1_n_281, s2_n_281; 
wire s1_n_282, s2_n_282; 
wire s1_n_283, s2_n_283; 
wire s1_n_284, s2_n_284; 
wire s1_n_285, s2_n_285; 
wire s1_n_286, s2_n_286; 
wire s1_n_287, s2_n_287; 
wire s1_n_288, s2_n_288; 
wire s1_n_289, s2_n_289; 
wire s1_n_290, s2_n_290; 
wire s1_n_291, s2_n_291; 
wire s1_n_292, s2_n_292; 
wire s1_n_293, s2_n_293; 
wire s1_n_294, s2_n_294; 
wire s1_n_295, s2_n_295; 
wire s1_n_296, s2_n_296; 
wire s1_n_297, s2_n_297; 
wire s1_n_298, s2_n_298; 
wire s1_n_299, s2_n_299; 
wire s1_n_300, s2_n_300; 
wire s1_n_301, s2_n_301; 
wire s1_n_302, s2_n_302; 
wire s1_n_303, s2_n_303; 
wire s1_n_304, s2_n_304; 
wire s1_n_305, s2_n_305; 
wire s1_n_306, s2_n_306; 
wire s1_n_307, s2_n_307; 
wire s1_n_308, s2_n_308; 
wire s1_n_309, s2_n_309; 
wire s1_n_310, s2_n_310; 
wire s1_n_311, s2_n_311; 
wire s1_n_312, s2_n_312; 
wire s1_n_313, s2_n_313; 
wire s1_n_314, s2_n_314; 
wire s1_n_315, s2_n_315; 
wire s1_n_316, s2_n_316; 
wire s1_n_317, s2_n_317; 
wire s1_n_318, s2_n_318; 
wire s1_n_319, s2_n_319; 
wire s1_n_320, s2_n_320; 
wire s1_n_321, s2_n_321; 
wire s1_n_322, s2_n_322; 
wire s1_n_323, s2_n_323; 
wire s1_n_324, s2_n_324; 
wire s1_n_325, s2_n_325; 
wire s1_n_326, s2_n_326; 
wire s1_n_327, s2_n_327; 
wire s1_n_328, s2_n_328; 
wire s1_n_329, s2_n_329; 
wire s1_n_330, s2_n_330; 
wire s1_n_331, s2_n_331; 
wire s1_n_332, s2_n_332; 
wire s1_n_333, s2_n_333; 
wire s1_n_334, s2_n_334; 
wire s1_n_335, s2_n_335; 
wire s1_n_336, s2_n_336; 
wire s1_n_337, s2_n_337; 
wire s1_n_338, s2_n_338; 
wire s1_n_339, s2_n_339; 
wire s1_n_340, s2_n_340; 
wire s1_n_341, s2_n_341; 
wire s1_n_342, s2_n_342; 
wire s1_n_343, s2_n_343; 
wire s1_n_344, s2_n_344; 
wire s1_n_345, s2_n_345; 
wire s1_n_346, s2_n_346; 
wire s1_n_347, s2_n_347; 
wire s1_n_348, s2_n_348; 
wire s1_n_349, s2_n_349; 
wire s1_n_350, s2_n_350; 
wire s1_n_351, s2_n_351; 
wire s1_n_352, s2_n_352; 
wire s1_n_353, s2_n_353; 
wire s1_n_354, s2_n_354; 
wire s1_n_355, s2_n_355; 
wire s1_n_356, s2_n_356; 
wire s1_n_357, s2_n_357; 
wire s1_n_358, s2_n_358; 
wire s1_n_359, s2_n_359; 
wire s1_n_360, s2_n_360; 
wire s1_n_361, s2_n_361; 
wire s1_n_362, s2_n_362; 
wire s1_n_363, s2_n_363; 
wire s1_n_364, s2_n_364; 
wire s1_n_365, s2_n_365; 
wire s1_n_366, s2_n_366; 
wire s1_n_367, s2_n_367; 
wire s1_n_368, s2_n_368; 
wire s1_n_369, s2_n_369; 
wire s1_n_370, s2_n_370; 
wire s1_n_371, s2_n_371; 
wire s1_n_372, s2_n_372; 
wire s1_n_373, s2_n_373; 
wire s1_n_374, s2_n_374; 
wire s1_n_375, s2_n_375; 
wire s1_n_376, s2_n_376; 
wire s1_n_377, s2_n_377; 
wire s1_n_378, s2_n_378; 
wire s1_n_379, s2_n_379; 
wire s1_n_380, s2_n_380; 
wire s1_n_381, s2_n_381; 
wire s1_n_382, s2_n_382; 
wire s1_n_383, s2_n_383; 
wire s1_n_384, s2_n_384; 
wire s1_n_385, s2_n_385; 
wire s1_n_386, s2_n_386; 
wire s1_n_387, s2_n_387; 
wire s1_n_388, s2_n_388; 
wire s1_n_389, s2_n_389; 
wire s1_n_390, s2_n_390; 
wire s1_n_391, s2_n_391; 
wire s1_n_392, s2_n_392; 
wire s1_n_393, s2_n_393; 
wire s1_n_394, s2_n_394; 
wire s1_n_395, s2_n_395; 
wire s1_n_396, s2_n_396; 
wire s1_n_397, s2_n_397; 
wire s1_n_398, s2_n_398; 
wire s1_n_399, s2_n_399; 
wire s1_n_400, s2_n_400; 
wire s1_n_401, s2_n_401; 
wire s1_n_402, s2_n_402; 
wire s1_n_403, s2_n_403; 
wire s1_n_404, s2_n_404; 
wire s1_n_405, s2_n_405; 
wire s1_n_406, s2_n_406; 
wire s1_n_407, s2_n_407; 
wire s1_n_408, s2_n_408; 
wire s1_n_409, s2_n_409; 
wire s1_n_410, s2_n_410; 
wire s1_n_411, s2_n_411; 
wire s1_n_412, s2_n_412; 
wire s1_n_413, s2_n_413; 
wire s1_n_414, s2_n_414; 
wire s1_n_415, s2_n_415; 
wire s1_n_416, s2_n_416; 
wire s1_n_417, s2_n_417; 
wire s1_n_418, s2_n_418; 
wire s1_n_419, s2_n_419; 
wire s1_n_420, s2_n_420; 
wire s1_n_421, s2_n_421; 
wire s1_n_422, s2_n_422; 
wire s1_n_423, s2_n_423; 
wire s1_n_424, s2_n_424; 
wire s1_n_425, s2_n_425; 
wire s1_n_426, s2_n_426; 
wire s1_n_427, s2_n_427; 
wire s1_n_428, s2_n_428; 
wire s1_n_429, s2_n_429; 
wire s1_n_430, s2_n_430; 
wire s1_n_431, s2_n_431; 
wire s1_n_432, s2_n_432; 
wire s1_n_433, s2_n_433; 
wire s1_n_434, s2_n_434; 
wire s1_n_435, s2_n_435; 
wire s1_n_436, s2_n_436; 
wire s1_n_437, s2_n_437; 
wire s1_n_438, s2_n_438; 
wire s1_n_439, s2_n_439; 
wire s1_n_440, s2_n_440; 
wire s1_n_441, s2_n_441; 
wire s1_n_442, s2_n_442; 
wire s1_n_443, s2_n_443; 
wire s1_n_444, s2_n_444; 
wire s1_n_445, s2_n_445; 
wire s1_n_446, s2_n_446; 
wire s1_n_447, s2_n_447; 
wire s1_n_448, s2_n_448; 
wire s1_n_449, s2_n_449; 
wire s1_n_450, s2_n_450; 
wire s1_n_451, s2_n_451; 
wire s1_n_452, s2_n_452; 
wire s1_n_453, s2_n_453; 
wire s1_n_454, s2_n_454; 
wire s1_n_455, s2_n_455; 
wire s1_n_456, s2_n_456; 
wire s1_n_457, s2_n_457; 
wire s1_n_458, s2_n_458; 
wire s1_n_459, s2_n_459; 
wire s1_n_460, s2_n_460; 
wire s1_n_461, s2_n_461; 
wire s1_n_462, s2_n_462; 
wire s1_n_463, s2_n_463; 
wire s1_n_464, s2_n_464; 
wire s1_n_465, s2_n_465; 
wire s1_n_466, s2_n_466; 
wire s1_n_467, s2_n_467; 
wire s1_n_468, s2_n_468; 
wire s1_n_469, s2_n_469; 
wire s1_n_470, s2_n_470; 
wire s1_n_471, s2_n_471; 
wire s1_n_472, s2_n_472; 
wire s1_n_473, s2_n_473; 
wire s1_n_474, s2_n_474; 
wire s1_n_475, s2_n_475; 
wire s1_n_476, s2_n_476; 
wire s1_n_477, s2_n_477; 
wire s1_n_478, s2_n_478; 
wire s1_n_479, s2_n_479; 
wire s1_n_480, s2_n_480; 
wire s1_n_481, s2_n_481; 
wire s1_n_482, s2_n_482; 
wire s1_n_483, s2_n_483; 
wire s1_n_484, s2_n_484; 
wire s1_n_485, s2_n_485; 
wire s1_n_486, s2_n_486; 
wire s1_n_487, s2_n_487; 
wire s1_n_488, s2_n_488; 
wire s1_n_489, s2_n_489; 
wire s1_n_490, s2_n_490; 
wire s1_n_491, s2_n_491; 
wire s1_n_492, s2_n_492; 
wire s1_n_493, s2_n_493; 
wire s1_n_494, s2_n_494; 
wire s1_n_495, s2_n_495; 
wire s1_n_496, s2_n_496; 
wire s1_n_497, s2_n_497; 
wire s1_n_498, s2_n_498; 
wire s1_n_499, s2_n_499; 
wire s1_n_500, s2_n_500; 
wire s1_n_501, s2_n_501; 
wire s1_n_502, s2_n_502; 
wire s1_n_503, s2_n_503; 
wire s1_n_504, s2_n_504; 
wire s1_n_505, s2_n_505; 
wire s1_n_506, s2_n_506; 
wire s1_n_507, s2_n_507; 
wire s1_n_508, s2_n_508; 
wire s1_n_509, s2_n_509; 
wire s1_n_510, s2_n_510; 
wire s1_n_511, s2_n_511; 
wire s1_n_512, s2_n_512; 
wire s1_n_513, s2_n_513; 
wire s1_n_514, s2_n_514; 
wire s1_n_515, s2_n_515; 
wire s1_n_516, s2_n_516; 
wire s1_n_517, s2_n_517; 
wire s1_n_518, s2_n_518; 
wire s1_n_519, s2_n_519; 
wire s1_n_520, s2_n_520; 
wire s1_n_521, s2_n_521; 
wire s1_n_522, s2_n_522; 
wire s1_n_523, s2_n_523; 
wire s1_n_524, s2_n_524; 
wire s1_n_525, s2_n_525; 
wire s1_n_526, s2_n_526; 
wire s1_n_527, s2_n_527; 
wire s1_n_528, s2_n_528; 
wire s1_n_529, s2_n_529; 
wire s1_n_530, s2_n_530; 
wire s1_n_531, s2_n_531; 
wire s1_n_532, s2_n_532; 
wire s1_n_533, s2_n_533; 
wire s1_n_534, s2_n_534; 
wire s1_n_535, s2_n_535; 
wire s1_n_536, s2_n_536; 
wire s1_n_537, s2_n_537; 
wire s1_n_538, s2_n_538; 
wire s1_n_539, s2_n_539; 
wire s1_n_540, s2_n_540; 
wire s1_n_541, s2_n_541; 
wire s1_n_542, s2_n_542; 
wire s1_n_543, s2_n_543; 
wire s1_n_544, s2_n_544; 
wire s1_n_545, s2_n_545; 
wire s1_n_546, s2_n_546; 
wire s1_n_547, s2_n_547; 
wire s1_n_548, s2_n_548; 
wire s1_n_549, s2_n_549; 
wire s1_n_550, s2_n_550; 
wire s1_n_551, s2_n_551; 
wire s1_n_552, s2_n_552; 
wire s1_n_553, s2_n_553; 
wire s1_n_554, s2_n_554; 
wire s1_n_555, s2_n_555; 
wire s1_n_556, s2_n_556; 
wire s1_n_557, s2_n_557; 
wire s1_n_558, s2_n_558; 
wire s1_n_559, s2_n_559; 
wire s1_n_560, s2_n_560; 
wire s1_n_561, s2_n_561; 
wire s1_n_562, s2_n_562; 
wire s1_n_563, s2_n_563; 
wire s1_n_564, s2_n_564; 
wire s1_n_565, s2_n_565; 
wire s1_n_566, s2_n_566; 
wire s1_n_567, s2_n_567; 
wire s1_n_568, s2_n_568; 
wire s1_n_569, s2_n_569; 
wire s1_n_570, s2_n_570; 
wire s1_n_571, s2_n_571; 
wire s1_n_572, s2_n_572; 
wire s1_n_573, s2_n_573; 
wire s1_n_574, s2_n_574; 
wire s1_n_575, s2_n_575; 
wire s1_n_576, s2_n_576; 
wire s1_n_577, s2_n_577; 
wire s1_n_578, s2_n_578; 
wire s1_n_579, s2_n_579; 
wire s1_n_580, s2_n_580; 
wire s1_n_581, s2_n_581; 
wire s1_n_582, s2_n_582; 
wire s1_n_583, s2_n_583; 
wire s1_n_584, s2_n_584; 
wire s1_n_585, s2_n_585; 
wire s1_n_586, s2_n_586; 
wire s1_n_587, s2_n_587; 
wire s1_n_588, s2_n_588; 
wire s1_n_589, s2_n_589; 
wire s1_n_590, s2_n_590; 
wire s1_n_591, s2_n_591; 
wire s1_n_592, s2_n_592; 
wire s1_n_593, s2_n_593; 
wire s1_n_594, s2_n_594; 
wire s1_n_595, s2_n_595; 
wire s1_n_596, s2_n_596; 
wire s1_n_597, s2_n_597; 
wire s1_n_598, s2_n_598; 
wire s1_n_599, s2_n_599; 
wire s1_n_600, s2_n_600; 
wire s1_n_601, s2_n_601; 
wire s1_n_602, s2_n_602; 
wire s1_n_603, s2_n_603; 
wire s1_n_604, s2_n_604; 
wire s1_n_605, s2_n_605; 
wire s1_n_606, s2_n_606; 
wire s1_n_607, s2_n_607; 
wire s1_n_608, s2_n_608; 
wire s1_n_609, s2_n_609; 
wire s1_n_610, s2_n_610; 
wire s1_n_611, s2_n_611; 
wire s1_n_612, s2_n_612; 
wire s1_n_613, s2_n_613; 
wire s1_n_614, s2_n_614; 
wire s1_n_615, s2_n_615; 
wire s1_n_616, s2_n_616; 
wire s1_n_617, s2_n_617; 
wire s1_n_618, s2_n_618; 
wire s1_n_619, s2_n_619; 
wire s1_n_620, s2_n_620; 
wire s1_n_621, s2_n_621; 
wire s1_n_622, s2_n_622; 
wire s1_n_623, s2_n_623; 
wire s1_n_624, s2_n_624; 
wire s1_n_625, s2_n_625; 
wire s1_n_626, s2_n_626; 
wire s1_n_627, s2_n_627; 
wire s1_n_628, s2_n_628; 
wire s1_n_629, s2_n_629; 
wire s1_n_630, s2_n_630; 
wire s1_n_631, s2_n_631; 
wire s1_n_632, s2_n_632; 
wire s1_n_633, s2_n_633; 
wire s1_n_634, s2_n_634; 
wire s1_n_635, s2_n_635; 
wire s1_n_636, s2_n_636; 
wire s1_n_637, s2_n_637; 
wire s1_n_638, s2_n_638; 
wire s1_n_639, s2_n_639; 
wire s1_n_640, s2_n_640; 
wire s1_n_641, s2_n_641; 
wire s1_n_642, s2_n_642; 
wire s1_n_643, s2_n_643; 
wire s1_n_644, s2_n_644; 
wire s1_n_645, s2_n_645; 
wire s1_n_646, s2_n_646; 
wire s1_n_647, s2_n_647; 
wire s1_n_648, s2_n_648; 
wire s1_n_649, s2_n_649; 
wire s1_n_650, s2_n_650; 
wire s1_n_651, s2_n_651; 
wire s1_n_652, s2_n_652; 
wire s1_n_653, s2_n_653; 
wire s1_n_654, s2_n_654; 
wire s1_n_655, s2_n_655; 
wire s1_n_656, s2_n_656; 
wire s1_n_657, s2_n_657; 
wire s1_n_658, s2_n_658; 
wire s1_n_659, s2_n_659; 
wire s1_n_660, s2_n_660; 
wire s1_n_661, s2_n_661; 
wire s1_n_662, s2_n_662; 
wire s1_n_663, s2_n_663; 
wire s1_n_664, s2_n_664; 
wire s1_n_665, s2_n_665; 
wire s1_n_666, s2_n_666; 
wire s1_n_667, s2_n_667; 
wire s1_n_668, s2_n_668; 
wire s1_n_669, s2_n_669; 
wire s1_n_670, s2_n_670; 
wire s1_n_671, s2_n_671; 
wire s1_n_672, s2_n_672; 
wire s1_n_673, s2_n_673; 
wire s1_n_674, s2_n_674; 
wire s1_n_675, s2_n_675; 
wire s1_n_676, s2_n_676; 
wire s1_n_677, s2_n_677; 
wire s1_n_678, s2_n_678; 
wire s1_n_679, s2_n_679; 
wire s1_n_680, s2_n_680; 
wire s1_n_681, s2_n_681; 
wire s1_n_682, s2_n_682; 
wire s1_n_683, s2_n_683; 
wire s1_n_684, s2_n_684; 
wire s1_n_685, s2_n_685; 
wire s1_n_686, s2_n_686; 
wire s1_n_687, s2_n_687; 
wire s1_n_688, s2_n_688; 
wire s1_n_689, s2_n_689; 
wire s1_n_690, s2_n_690; 
wire s1_n_691, s2_n_691; 
wire s1_n_692, s2_n_692; 
wire s1_n_693, s2_n_693; 
wire s1_n_694, s2_n_694; 
wire s1_n_695, s2_n_695; 
wire s1_n_696, s2_n_696; 
wire s1_n_697, s2_n_697; 
wire s1_n_698, s2_n_698; 
wire s1_n_699, s2_n_699; 
wire s1_n_700, s2_n_700; 
wire s1_n_701, s2_n_701; 
wire s1_n_702, s2_n_702; 
wire s1_n_703, s2_n_703; 
wire s1_n_704, s2_n_704; 
wire s1_n_705, s2_n_705; 
wire s1_n_706, s2_n_706; 
wire s1_n_707, s2_n_707; 
wire s1_n_708, s2_n_708; 
wire s1_n_709, s2_n_709; 
wire s1_n_710, s2_n_710; 
wire s1_n_711, s2_n_711; 
wire s1_n_712, s2_n_712; 
wire s1_n_713, s2_n_713; 
wire s1_n_714, s2_n_714; 
wire s1_n_715, s2_n_715; 
wire s1_n_716, s2_n_716; 
wire s1_n_717, s2_n_717; 
wire s1_n_718, s2_n_718; 
wire s1_n_719, s2_n_719; 
wire s1_n_720, s2_n_720; 
wire s1_n_721, s2_n_721; 
wire s1_n_722, s2_n_722; 
wire s1_n_723, s2_n_723; 
wire s1_n_724, s2_n_724; 
wire s1_n_725, s2_n_725; 
wire s1_n_726, s2_n_726; 
wire s1_n_727, s2_n_727; 
wire s1_n_728, s2_n_728; 
wire s1_n_729, s2_n_729; 
wire s1_n_730, s2_n_730; 
wire s1_n_731, s2_n_731; 
wire s1_n_732, s2_n_732; 
wire s1_n_733, s2_n_733; 
wire s1_n_734, s2_n_734; 
wire s1_n_735, s2_n_735; 
wire s1_n_736, s2_n_736; 
wire s1_n_737, s2_n_737; 
wire s1_n_738, s2_n_738; 
wire s1_n_739, s2_n_739; 
wire s1_n_740, s2_n_740; 
wire s1_n_741, s2_n_741; 
wire s1_n_742, s2_n_742; 
wire s1_n_743, s2_n_743; 
wire s1_n_744, s2_n_744; 
wire s1_n_745, s2_n_745; 
wire s1_n_746, s2_n_746; 
wire s1_n_747, s2_n_747; 
wire s1_n_748, s2_n_748; 
wire s1_n_749, s2_n_749; 
wire s1_n_750, s2_n_750; 
wire s1_n_751, s2_n_751; 
wire s1_n_752, s2_n_752; 
wire s1_n_753, s2_n_753; 
wire s1_n_754, s2_n_754; 
wire s1_n_755, s2_n_755; 
wire s1_n_756, s2_n_756; 
wire s1_n_757, s2_n_757; 
wire s1_n_759, s2_n_759; 
wire s1_n_760, s2_n_760; 
wire s1_n_761, s2_n_761; 
wire s1_n_762, s2_n_762; 
wire s1_n_766, s2_n_766; 
wire s1_n_768, s2_n_768; 
wire s1_n_769, s2_n_769; 
wire s1_n_771, s2_n_771; 
wire s1_n_773, s2_n_773; 
wire s1_n_774, s2_n_774; 
wire s1_n_775, s2_n_775; 
wire s1_n_785, s2_n_785; 

//  OR2XD1 g13531__2398(.A1 (n_775), .A2 (n_298), .Z (sbox_out[0]));  
assign s1_sbox_out[0] = (s2_n_775 | s1_n_298) ^ (s2_n_775 & s2_n_298); 
assign s2_sbox_out[0] = (s1_n_775 & s1_n_298) ^ (s1_n_775 | s2_n_298); 

//  ND2D1 g13532__5107(.A1 (n_774), .A2 (n_280), .ZN (n_775));  
assign s1_n_775 = ~(s1_n_774 & s1_n_280) ^ (s1_n_774 & s2_n_280); 
assign s2_n_775 = (s2_n_774 & s1_n_280) ^ (s2_n_774 & s2_n_280); 

//  NR2XD0 g13533__6260(.A1 (n_773), .A2 (n_309), .ZN (n_774));  
assign s1_n_774 = ~(s2_n_773 | s1_n_309) ^ (s2_n_773 & s2_n_309); 
assign s2_n_774 = (s1_n_773 & s1_n_309) ^ (s1_n_773 | s2_n_309); 

//  ND2D1 g13534__4319(.A1 (n_771), .A2 (n_644), .ZN (n_773));  
assign s1_n_773 = ~(s1_n_771 & s1_n_644) ^ (s1_n_771 & s2_n_644); 
assign s2_n_773 = (s2_n_771 & s1_n_644) ^ (s2_n_771 & s2_n_644); 

//  ND2D1 g13537__8428(.A1 (n_769), .A2 (n_289), .ZN (sbox_out[6]));  
assign s1_sbox_out[6] = ~(s1_n_769 & s1_n_289) ^ (s1_n_769 & s2_n_289); 
assign s2_sbox_out[6] = (s2_n_769 & s1_n_289) ^ (s2_n_769 & s2_n_289); 

//  NR2XD0 g13535__5526(.A1 (n_768), .A2 (n_683), .ZN (n_771));  
assign s1_n_771 = ~(s2_n_768 | s1_n_683) ^ (s2_n_768 & s2_n_683); 
assign s2_n_771 = (s1_n_768 & s1_n_683) ^ (s1_n_768 | s2_n_683); 

//  OR2D1 g13540__6783(.A1 (n_766), .A2 (n_492), .Z (sbox_out[2]));  
assign s1_sbox_out[2] = (s2_n_766 | s1_n_492) ^ (s2_n_766 & s2_n_492); 
assign s2_sbox_out[2] = (s1_n_766 & s1_n_492) ^ (s1_n_766 | s2_n_492); 

//  NR2D1 g13542__3680(.A1 (n_761), .A2 (n_228), .ZN (n_769));  
assign s1_n_769 = ~(s2_n_761 | s1_n_228) ^ (s2_n_761 & s2_n_228); 
assign s2_n_769 = (s1_n_761 & s1_n_228) ^ (s1_n_761 | s2_n_228); 

//  ND2D1 g13536__1617(.A1 (n_762), .A2 (n_596), .ZN (n_768));  
assign s1_n_768 = ~(s1_n_762 & s1_n_596) ^ (s1_n_762 & s2_n_596); 
assign s2_n_768 = (s2_n_762 & s1_n_596) ^ (s2_n_762 & s2_n_596); 

//  ND2D0 g13539__2802(.A1 (n_760), .A2 (n_593), .ZN (sbox_out[3]));  
assign s1_sbox_out[3] = ~(s1_n_760 & s1_n_593) ^ (s1_n_760 & s2_n_593); 
assign s2_sbox_out[3] = (s2_n_760 & s1_n_593) ^ (s2_n_760 & s2_n_593); 

//  ND2D1 g13547__1705(.A1 (n_756), .A2 (n_709), .ZN (n_766));  
assign s1_n_766 = ~(s1_n_756 & s1_n_709) ^ (s1_n_756 & s2_n_709); 
assign s2_n_766 = (s2_n_756 & s1_n_709) ^ (s2_n_756 & s2_n_709); 

//  OR2D1 g13538__5122(.A1 (n_753), .A2 (n_660), .Z (sbox_out[5]));  
assign s1_sbox_out[5] = (s2_n_753 | s1_n_660) ^ (s2_n_753 & s2_n_660); 
assign s2_sbox_out[5] = (s1_n_753 & s1_n_660) ^ (s1_n_753 | s2_n_660); 

//  OR2D1 g13545__8246(.A1 (n_755), .A2 (n_625), .Z (sbox_out[4]));  
assign s1_sbox_out[4] = (s2_n_755 | s1_n_625) ^ (s2_n_755 & s2_n_625); 
assign s2_sbox_out[4] = (s1_n_755 & s1_n_625) ^ (s1_n_755 | s2_n_625); 

//  ND2D0 g13543__7098(.A1 (n_754), .A2 (n_581), .ZN (sbox_out[1]));  
assign s1_sbox_out[1] = ~(s1_n_754 & s1_n_581) ^ (s1_n_754 & s2_n_581); 
assign s2_sbox_out[1] = (s2_n_754 & s1_n_581) ^ (s2_n_754 & s2_n_581); 

//  NR2D1 g13541__6131(.A1 (n_757), .A2 (n_401), .ZN (n_762));  
assign s1_n_762 = ~(s2_n_757 | s1_n_401) ^ (s2_n_757 & s2_n_401); 
assign s2_n_762 = (s1_n_757 & s1_n_401) ^ (s1_n_757 | s2_n_401); 

//  ND2D1 g13548__1881(.A1 (n_759), .A2 (n_752), .ZN (n_761));  
assign s1_n_761 = ~(s1_n_759 & s1_n_752) ^ (s1_n_759 & s2_n_752); 
assign s2_n_761 = (s2_n_759 & s1_n_752) ^ (s2_n_759 & s2_n_752); 

//  NR2XD0 g13544__5115(.A1 (n_751), .A2 (n_714), .ZN (n_760));  
assign s1_n_760 = ~(s2_n_751 | s1_n_714) ^ (s2_n_751 & s2_n_714); 
assign s2_n_760 = (s1_n_751 & s1_n_714) ^ (s1_n_751 | s2_n_714); 

//  ND2D1 g13558__7482(.A1 (n_745), .A2 (sbox_in[5]), .ZN (n_759));  
assign s1_n_759 = ~(s1_n_745 & s1_sbox_in[5]) ^ (s1_n_745 & s2_sbox_in[5]); 
assign s2_n_759 = (s2_n_745 & s1_sbox_in[5]) ^ (s2_n_745 & s2_sbox_in[5]); 

//  ND2D0 g13549__4733(.A1 (n_744), .A2 (n_668), .ZN (sbox_out[7]));  
assign s1_sbox_out[7] = ~(s1_n_744 & s1_n_668) ^ (s1_n_744 & s2_n_668); 
assign s2_sbox_out[7] = (s2_n_744 & s1_n_668) ^ (s2_n_744 & s2_n_668); 

//  NR2D1 g13550__6161(.A1 (n_747), .A2 (n_735), .ZN (n_757));  
assign s1_n_757 = ~(s2_n_747 | s1_n_735) ^ (s2_n_747 & s2_n_735); 
assign s2_n_757 = (s1_n_747 & s1_n_735) ^ (s1_n_747 | s2_n_735); 

//  NR2XD0 g13554__9315(.A1 (n_749), .A2 (n_695), .ZN (n_756));  
assign s1_n_756 = ~(s2_n_749 | s1_n_695) ^ (s2_n_749 & s2_n_695); 
assign s2_n_756 = (s1_n_749 & s1_n_695) ^ (s1_n_749 | s2_n_695); 

//  ND2D1 g13552__9945(.A1 (n_748), .A2 (n_701), .ZN (n_755));  
assign s1_n_755 = ~(s1_n_748 & s1_n_701) ^ (s1_n_748 & s2_n_701); 
assign s2_n_755 = (s2_n_748 & s1_n_701) ^ (s2_n_748 & s2_n_701); 

//  NR2XD0 g13551__2883(.A1 (n_750), .A2 (n_702), .ZN (n_754));  
assign s1_n_754 = ~(s2_n_750 | s1_n_702) ^ (s2_n_750 & s2_n_702); 
assign s2_n_754 = (s1_n_750 & s1_n_702) ^ (s1_n_750 | s2_n_702); 

//  ND2D1 g13546__2346(.A1 (n_746), .A2 (n_697), .ZN (n_753));  
assign s1_n_753 = ~(s1_n_746 & s1_n_697) ^ (s1_n_746 & s2_n_697); 
assign s2_n_753 = (s2_n_746 & s1_n_697) ^ (s2_n_746 & s2_n_697); 

//  NR2XD0 g13559__1666(.A1 (n_743), .A2 (n_294), .ZN (n_752));  
assign s1_n_752 = ~(s2_n_743 | s1_n_294) ^ (s2_n_743 & s2_n_294); 
assign s2_n_752 = (s1_n_743 & s1_n_294) ^ (s1_n_743 | s2_n_294); 

//  ND2D1 g13556__7410(.A1 (n_742), .A2 (n_634), .ZN (n_751));  
assign s1_n_751 = ~(s1_n_742 & s1_n_634) ^ (s1_n_742 & s2_n_634); 
assign s2_n_751 = (s2_n_742 & s1_n_634) ^ (s2_n_742 & s2_n_634); 

//  ND2D1 g13560__6417(.A1 (n_736), .A2 (n_694), .ZN (n_750));  
assign s1_n_750 = ~(s1_n_736 & s1_n_694) ^ (s1_n_736 & s2_n_694); 
assign s2_n_750 = (s2_n_736 & s1_n_694) ^ (s2_n_736 & s2_n_694); 

//  ND2D1 g13563__5477(.A1 (n_737), .A2 (n_382), .ZN (n_749));  
assign s1_n_749 = ~(s1_n_737 & s1_n_382) ^ (s1_n_737 & s2_n_382); 
assign s2_n_749 = (s2_n_737 & s1_n_382) ^ (s2_n_737 & s2_n_382); 

//  NR2XD0 g13564__2398(.A1 (n_734), .A2 (n_627), .ZN (n_748));  
assign s1_n_748 = ~(s2_n_734 | s1_n_627) ^ (s2_n_734 & s2_n_627); 
assign s2_n_748 = (s1_n_734 & s1_n_627) ^ (s1_n_734 | s2_n_627); 

//  NR2XD0 g13555__5107(.A1 (n_741), .A2 (n_122), .ZN (n_747));  
assign s1_n_747 = ~(s2_n_741 | s1_n_122) ^ (s2_n_741 & s2_n_122); 
assign s2_n_747 = (s1_n_741 & s1_n_122) ^ (s1_n_741 | s2_n_122); 

//  NR2XD0 g13553__6260(.A1 (n_740), .A2 (n_550), .ZN (n_746));  
assign s1_n_746 = ~(s2_n_740 | s1_n_550) ^ (s2_n_740 & s2_n_550); 
assign s2_n_746 = (s1_n_740 & s1_n_550) ^ (s1_n_740 | s2_n_550); 

//  ND2D1 g13566__4319(.A1 (n_738), .A2 (n_482), .ZN (n_745));  
assign s1_n_745 = ~(s1_n_738 & s1_n_482) ^ (s1_n_738 & s2_n_482); 
assign s2_n_745 = (s2_n_738 & s1_n_482) ^ (s2_n_738 & s2_n_482); 

//  NR2D1 g13557__8428(.A1 (n_739), .A2 (n_628), .ZN (n_744));  
assign s1_n_744 = ~(s2_n_739 | s1_n_628) ^ (s2_n_739 & s2_n_628); 
assign s2_n_744 = (s1_n_739 & s1_n_628) ^ (s1_n_739 | s2_n_628); 

//  ND2D1 g13565__5526(.A1 (n_733), .A2 (n_643), .ZN (n_743));  
assign s1_n_743 = ~(s1_n_733 & s1_n_643) ^ (s1_n_733 & s2_n_643); 
assign s2_n_743 = (s2_n_733 & s1_n_643) ^ (s2_n_733 & s2_n_643); 

//  ND2D1 g13568__6783(.A1 (n_732), .A2 (sbox_in[5]), .ZN (n_742));  
assign s1_n_742 = ~(s1_n_732 & s1_sbox_in[5]) ^ (s1_n_732 & s2_sbox_in[5]); 
assign s2_n_742 = (s2_n_732 & s1_sbox_in[5]) ^ (s2_n_732 & s2_sbox_in[5]); 

//  ND2D1 g13561__3680(.A1 (n_728), .A2 (n_685), .ZN (n_741));  
assign s1_n_741 = ~(s1_n_728 & s1_n_685) ^ (s1_n_728 & s2_n_685); 
assign s2_n_741 = (s2_n_728 & s1_n_685) ^ (s2_n_728 & s2_n_685); 

//  NR2D1 g13562__1617(.A1 (n_726), .A2 (sbox_in[5]), .ZN (n_740));  
assign s1_n_740 = ~(s2_n_726 | s1_sbox_in[5]) ^ (s2_n_726 & s2_sbox_in[5]); 
assign s2_n_740 = (s1_n_726 & s1_sbox_in[5]) ^ (s1_n_726 | s2_sbox_in[5]); 

//  ND2D1 g13567__2802(.A1 (n_727), .A2 (n_715), .ZN (n_739));  
assign s1_n_739 = ~(s1_n_727 & s1_n_715) ^ (s1_n_727 & s2_n_715); 
assign s2_n_739 = (s2_n_727 & s1_n_715) ^ (s2_n_727 & s2_n_715); 

//  NR2D1 g13575__1705(.A1 (n_731), .A2 (n_277), .ZN (n_738));  
assign s1_n_738 = ~(s2_n_731 | s1_n_277) ^ (s2_n_731 & s2_n_277); 
assign s2_n_738 = (s1_n_731 & s1_n_277) ^ (s1_n_731 | s2_n_277); 

//  NR2XD0 g13572__5122(.A1 (n_730), .A2 (n_362), .ZN (n_737));  
assign s1_n_737 = ~(s2_n_730 | s1_n_362) ^ (s2_n_730 & s2_n_362); 
assign s2_n_737 = (s1_n_730 & s1_n_362) ^ (s1_n_730 | s2_n_362); 

//  ND2D1 g13569__8246(.A1 (n_725), .A2 (n_735), .ZN (n_736));  
assign s1_n_736 = ~(s1_n_725 & s1_n_735) ^ (s1_n_725 & s2_n_735); 
assign s2_n_736 = (s2_n_725 & s1_n_735) ^ (s2_n_725 & s2_n_735); 

//  NR2D1 g13576__7098(.A1 (n_729), .A2 (sbox_in[5]), .ZN (n_734));  
assign s1_n_734 = ~(s2_n_729 | s1_sbox_in[5]) ^ (s2_n_729 & s2_sbox_in[5]); 
assign s2_n_734 = (s1_n_729 & s1_sbox_in[5]) ^ (s1_n_729 | s2_sbox_in[5]); 

//  NR2XD0 g13570__6131(.A1 (n_723), .A2 (n_438), .ZN (n_733));  
assign s1_n_733 = ~(s2_n_723 | s1_n_438) ^ (s2_n_723 & s2_n_438); 
assign s2_n_733 = (s1_n_723 & s1_n_438) ^ (s1_n_723 | s2_n_438); 

//  ND2D1 g13578__1881(.A1 (n_724), .A2 (n_612), .ZN (n_732));  
assign s1_n_732 = ~(s1_n_724 & s1_n_612) ^ (s1_n_724 & s2_n_612); 
assign s2_n_732 = (s2_n_724 & s1_n_612) ^ (s2_n_724 & s2_n_612); 

//  ND2D1 g13582__5115(.A1 (n_719), .A2 (n_617), .ZN (n_731));  
assign s1_n_731 = ~(s1_n_719 & s1_n_617) ^ (s1_n_719 & s2_n_617); 
assign s2_n_731 = (s2_n_719 & s1_n_617) ^ (s2_n_719 & s2_n_617); 

//  NR2D1 g13583__7482(.A1 (n_718), .A2 (n_735), .ZN (n_730));  
assign s1_n_730 = ~(s2_n_718 | s1_n_735) ^ (s2_n_718 & s2_n_735); 
assign s2_n_730 = (s1_n_718 & s1_n_735) ^ (s1_n_718 | s2_n_735); 

//  NR2XD0 g13587__4733(.A1 (n_716), .A2 (n_679), .ZN (n_729));  
assign s1_n_729 = ~(s2_n_716 | s1_n_679) ^ (s2_n_716 & s2_n_679); 
assign s2_n_729 = (s1_n_716 & s1_n_679) ^ (s1_n_716 | s2_n_679); 

//  NR2XD0 g13574__6161(.A1 (n_717), .A2 (n_488), .ZN (n_728));  
assign s1_n_728 = ~(s2_n_717 | s1_n_488) ^ (s2_n_717 & s2_n_488); 
assign s2_n_728 = (s1_n_717 & s1_n_488) ^ (s1_n_717 | s2_n_488); 

//  ND2D1 g13573__9315(.A1 (n_722), .A2 (sbox_in[5]), .ZN (n_727));  
assign s1_n_727 = ~(s1_n_722 & s1_sbox_in[5]) ^ (s1_n_722 & s2_sbox_in[5]); 
assign s2_n_727 = (s2_n_722 & s1_sbox_in[5]) ^ (s2_n_722 & s2_sbox_in[5]); 

//  NR2XD0 g13571__9945(.A1 (n_721), .A2 (n_464), .ZN (n_726));  
assign s1_n_726 = ~(s2_n_721 | s1_n_464) ^ (s2_n_721 & s2_n_464); 
assign s2_n_726 = (s1_n_721 & s1_n_464) ^ (s1_n_721 | s2_n_464); 

//  ND2D1 g13577__2883(.A1 (n_720), .A2 (n_527), .ZN (n_725));  
assign s1_n_725 = ~(s1_n_720 & s1_n_527) ^ (s1_n_720 & s2_n_527); 
assign s2_n_725 = (s2_n_720 & s1_n_527) ^ (s2_n_720 & s2_n_527); 

//  NR2XD0 g13580__2346(.A1 (n_713), .A2 (n_585), .ZN (n_724));  
assign s1_n_724 = ~(s2_n_713 | s1_n_585) ^ (s2_n_713 & s2_n_585); 
assign s2_n_724 = (s1_n_713 & s1_n_585) ^ (s1_n_713 | s2_n_585); 

//  AN2XD1 g13581__1666(.A1 (n_712), .A2 (n_735), .Z (n_723));  
assign s1_n_723 = (s1_n_712 & s1_n_735) ^ (s1_n_712 & s2_n_735); 
assign s2_n_723 = (s2_n_712 & s1_n_735) ^ (s2_n_712 & s2_n_735); 

//  ND2D1 g13584__7410(.A1 (n_708), .A2 (n_557), .ZN (n_722));  
assign s1_n_722 = ~(s1_n_708 & s1_n_557) ^ (s1_n_708 & s2_n_557); 
assign s2_n_722 = (s2_n_708 & s1_n_557) ^ (s2_n_708 & s2_n_557); 

//  ND2D1 g13585__6417(.A1 (n_705), .A2 (n_355), .ZN (n_721));  
assign s1_n_721 = ~(s1_n_705 & s1_n_355) ^ (s1_n_705 & s2_n_355); 
assign s2_n_721 = (s2_n_705 & s1_n_355) ^ (s2_n_705 & s2_n_355); 

//  NR2XD0 g13586__5477(.A1 (n_711), .A2 (n_659), .ZN (n_720));  
assign s1_n_720 = ~(s2_n_711 | s1_n_659) ^ (s2_n_711 & s2_n_659); 
assign s2_n_720 = (s1_n_711 & s1_n_659) ^ (s1_n_711 | s2_n_659); 

//  NR2XD0 g13594__2398(.A1 (n_704), .A2 (n_681), .ZN (n_719));  
assign s1_n_719 = ~(s2_n_704 | s1_n_681) ^ (s2_n_704 & s2_n_681); 
assign s2_n_719 = (s1_n_704 & s1_n_681) ^ (s1_n_704 | s2_n_681); 

//  NR2XD0 g13589__5107(.A1 (n_706), .A2 (n_664), .ZN (n_718));  
assign s1_n_718 = ~(s2_n_706 | s1_n_664) ^ (s2_n_706 & s2_n_664); 
assign s2_n_718 = (s1_n_706 & s1_n_664) ^ (s1_n_706 | s2_n_664); 

//  ND2D1 g13588__6260(.A1 (n_710), .A2 (n_452), .ZN (n_717));  
assign s1_n_717 = ~(s1_n_710 & s1_n_452) ^ (s1_n_710 & s2_n_452); 
assign s2_n_717 = (s2_n_710 & s1_n_452) ^ (s2_n_710 & s2_n_452); 

//  ND2D1 g13597__4319(.A1 (n_707), .A2 (n_461), .ZN (n_716));  
assign s1_n_716 = ~(s1_n_707 & s1_n_461) ^ (s1_n_707 & s2_n_461); 
assign s2_n_716 = (s2_n_707 & s1_n_461) ^ (s2_n_707 & s2_n_461); 

//  OR2D1 g13579__8428(.A1 (n_703), .A2 (sbox_in[5]), .Z (n_715));  
assign s1_n_715 = (s2_n_703 | s1_sbox_in[5]) ^ (s2_n_703 & s2_sbox_in[5]); 
assign s2_n_715 = (s1_n_703 & s1_sbox_in[5]) ^ (s1_n_703 | s2_sbox_in[5]); 

//  NR2XD0 g13590__5526(.A1 (n_700), .A2 (sbox_in[5]), .ZN (n_714));  
assign s1_n_714 = ~(s2_n_700 | s1_sbox_in[5]) ^ (s2_n_700 & s2_sbox_in[5]); 
assign s2_n_714 = (s1_n_700 & s1_sbox_in[5]) ^ (s1_n_700 | s2_sbox_in[5]); 

//  ND2D1 g13592__6783(.A1 (n_698), .A2 (n_670), .ZN (n_713));  
assign s1_n_713 = ~(s1_n_698 & s1_n_670) ^ (s1_n_698 & s2_n_670); 
assign s2_n_713 = (s2_n_698 & s1_n_670) ^ (s2_n_698 & s2_n_670); 

//  NR2D1 g13595__3680(.A1 (n_699), .A2 (sbox_in[7]), .ZN (n_712));  
assign s1_n_712 = ~(s2_n_699 | s1_sbox_in[7]) ^ (s2_n_699 & s2_sbox_in[7]); 
assign s2_n_712 = (s1_n_699 & s1_sbox_in[7]) ^ (s1_n_699 | s2_sbox_in[7]); 

//  ND2D1 g13598__1617(.A1 (n_687), .A2 (n_640), .ZN (n_711));  
assign s1_n_711 = ~(s1_n_687 & s1_n_640) ^ (s1_n_687 & s2_n_640); 
assign s2_n_711 = (s2_n_687 & s1_n_640) ^ (s2_n_687 & s2_n_640); 

//  NR2XD0 g13596__2802(.A1 (n_686), .A2 (n_407), .ZN (n_710));  
assign s1_n_710 = ~(s2_n_686 | s1_n_407) ^ (s2_n_686 & s2_n_407); 
assign s2_n_710 = (s1_n_686 & s1_n_407) ^ (s1_n_686 | s2_n_407); 

//  ND2D1 g13593__1705(.A1 (n_688), .A2 (n_735), .ZN (n_709));  
assign s1_n_709 = ~(s1_n_688 & s1_n_735) ^ (s1_n_688 & s2_n_735); 
assign s2_n_709 = (s2_n_688 & s1_n_735) ^ (s2_n_688 & s2_n_735); 

//  NR2XD0 g13601__5122(.A1 (n_689), .A2 (n_572), .ZN (n_708));  
assign s1_n_708 = ~(s2_n_689 | s1_n_572) ^ (s2_n_689 & s2_n_572); 
assign s2_n_708 = (s1_n_689 & s1_n_572) ^ (s1_n_689 | s2_n_572); 

//  NR2XD0 g13606__8246(.A1 (n_691), .A2 (n_624), .ZN (n_707));  
assign s1_n_707 = ~(s2_n_691 | s1_n_624) ^ (s2_n_691 & s2_n_624); 
assign s2_n_707 = (s1_n_691 & s1_n_624) ^ (s1_n_691 | s2_n_624); 

//  ND2D1 g13603__7098(.A1 (n_696), .A2 (n_684), .ZN (n_706));  
assign s1_n_706 = ~(s1_n_696 & s1_n_684) ^ (s1_n_696 & s2_n_684); 
assign s2_n_706 = (s2_n_696 & s1_n_684) ^ (s2_n_696 & s2_n_684); 

//  NR2XD0 g13602__6131(.A1 (n_690), .A2 (n_653), .ZN (n_705));  
assign s1_n_705 = ~(s2_n_690 | s1_n_653) ^ (s2_n_690 & s2_n_653); 
assign s2_n_705 = (s1_n_690 & s1_n_653) ^ (s1_n_690 | s2_n_653); 

//  ND2D1 g13613__1881(.A1 (n_693), .A2 (n_285), .ZN (n_704));  
assign s1_n_704 = ~(s1_n_693 & s1_n_285) ^ (s1_n_693 & s2_n_285); 
assign s2_n_704 = (s2_n_693 & s1_n_285) ^ (s2_n_693 & s2_n_285); 

//  ND2D1 g13591__5115(.A1 (n_678), .A2 (sbox_in[7]), .ZN (n_703));  
assign s1_n_703 = ~(s1_n_678 & s1_sbox_in[7]) ^ (s1_n_678 & s2_sbox_in[7]); 
assign s2_n_703 = (s2_n_678 & s1_sbox_in[7]) ^ (s2_n_678 & s2_sbox_in[7]); 

//  NR2XD0 g13599__7482(.A1 (n_676), .A2 (n_735), .ZN (n_702));  
assign s1_n_702 = ~(s2_n_676 | s1_n_735) ^ (s2_n_676 & s2_n_735); 
assign s2_n_702 = (s1_n_676 & s1_n_735) ^ (s1_n_676 | s2_n_735); 

//  ND2D1 g13600__4733(.A1 (n_677), .A2 (sbox_in[5]), .ZN (n_701));  
assign s1_n_701 = ~(s1_n_677 & s1_sbox_in[5]) ^ (s1_n_677 & s2_sbox_in[5]); 
assign s2_n_701 = (s2_n_677 & s1_sbox_in[5]) ^ (s2_n_677 & s2_sbox_in[5]); 

//  ND2D1 g13609__6161(.A1 (n_674), .A2 (sbox_in[7]), .ZN (n_700));  
assign s1_n_700 = ~(s1_n_674 & s1_sbox_in[7]) ^ (s1_n_674 & s2_sbox_in[7]); 
assign s2_n_700 = (s2_n_674 & s1_sbox_in[7]) ^ (s2_n_674 & s2_sbox_in[7]); 

//  NR2XD0 g13607__9315(.A1 (n_673), .A2 (n_390), .ZN (n_699));  
assign s1_n_699 = ~(s2_n_673 | s1_n_390) ^ (s2_n_673 & s2_n_390); 
assign s2_n_699 = (s1_n_673 & s1_n_390) ^ (s1_n_673 | s2_n_390); 

//  ND2D1 g13604__9945(.A1 (n_675), .A2 (n_692), .ZN (n_698));  
assign s1_n_698 = ~(s1_n_675 & s1_n_692) ^ (s1_n_675 & s2_n_692); 
assign s2_n_698 = (s2_n_675 & s1_n_692) ^ (s2_n_675 & s2_n_692); 

//  ND2D1 g13615__2883(.A1 (n_682), .A2 (sbox_in[5]), .ZN (n_697));  
assign s1_n_697 = ~(s1_n_682 & s1_sbox_in[5]) ^ (s1_n_682 & s2_sbox_in[5]); 
assign s2_n_697 = (s2_n_682 & s1_sbox_in[5]) ^ (s2_n_682 & s2_sbox_in[5]); 

//  NR2XD0 g13636__2346(.A1 (n_639), .A2 (n_663), .ZN (n_696));  
assign s1_n_696 = ~(s2_n_639 | s1_n_663) ^ (s2_n_639 & s2_n_663); 
assign s2_n_696 = (s1_n_639 & s1_n_663) ^ (s1_n_639 | s2_n_663); 

//  ND2D1 g13629__1666(.A1 (n_661), .A2 (n_379), .ZN (n_695));  
assign s1_n_695 = ~(s1_n_661 & s1_n_379) ^ (s1_n_661 & s2_n_379); 
assign s2_n_695 = (s2_n_661 & s1_n_379) ^ (s2_n_661 & s2_n_379); 

//  ND2D1 g13626__7410(.A1 (n_662), .A2 (n_110), .ZN (n_694));  
assign s1_n_694 = ~(s1_n_662 & s1_n_110) ^ (s1_n_662 & s2_n_110); 
assign s2_n_694 = (s2_n_662 & s1_n_110) ^ (s2_n_662 & s2_n_110); 

//  ND2D1 g13638__6417(.A1 (n_657), .A2 (n_692), .ZN (n_693));  
assign s1_n_693 = ~(s1_n_657 & s1_n_692) ^ (s1_n_657 & s2_n_692); 
assign s2_n_693 = (s2_n_657 & s1_n_692) ^ (s2_n_657 & s2_n_692); 

//  NR2D1 g13639__5477(.A1 (n_658), .A2 (n_680), .ZN (n_691));  
assign s1_n_691 = ~(s2_n_658 | s1_n_680) ^ (s2_n_658 & s2_n_680); 
assign s2_n_691 = (s1_n_658 & s1_n_680) ^ (s1_n_658 | s2_n_680); 

//  ND2D1 g13614__2398(.A1 (n_666), .A2 (n_648), .ZN (n_690));  
assign s1_n_690 = ~(s1_n_666 & s1_n_648) ^ (s1_n_666 & s2_n_648); 
assign s2_n_690 = (s2_n_666 & s1_n_648) ^ (s2_n_666 & s2_n_648); 

//  ND2D1 g13610__5107(.A1 (n_669), .A2 (n_519), .ZN (n_689));  
assign s1_n_689 = ~(s1_n_669 & s1_n_519) ^ (s1_n_669 & s2_n_519); 
assign s2_n_689 = (s2_n_669 & s1_n_519) ^ (s2_n_669 & s2_n_519); 

//  NR2XD0 g13605__6260(.A1 (n_656), .A2 (sbox_in[7]), .ZN (n_688));  
assign s1_n_688 = ~(s2_n_656 | s1_sbox_in[7]) ^ (s2_n_656 & s2_sbox_in[7]); 
assign s2_n_688 = (s1_n_656 & s1_sbox_in[7]) ^ (s1_n_656 | s2_sbox_in[7]); 

//  NR2XD0 g13616__4319(.A1 (n_672), .A2 (n_354), .ZN (n_687));  
assign s1_n_687 = ~(s2_n_672 | s1_n_354) ^ (s2_n_672 & s2_n_354); 
assign s2_n_687 = (s1_n_672 & s1_n_354) ^ (s1_n_672 | s2_n_354); 

//  NR2D1 g13617__8428(.A1 (n_667), .A2 (n_671), .ZN (n_686));  
assign s1_n_686 = ~(s2_n_667 | s1_n_671) ^ (s2_n_667 & s2_n_671); 
assign s2_n_686 = (s1_n_667 & s1_n_671) ^ (s1_n_667 | s2_n_671); 

//  ND2D1 g13622__5526(.A1 (n_636), .A2 (n_647), .ZN (n_685));  
assign s1_n_685 = ~(s1_n_636 & s1_n_647) ^ (s1_n_636 & s2_n_647); 
assign s2_n_685 = (s2_n_636 & s1_n_647) ^ (s2_n_636 & s2_n_647); 

//  ND2D1 g13625__6783(.A1 (n_655), .A2 (n_665), .ZN (n_684));  
assign s1_n_684 = ~(s1_n_655 & s1_n_665) ^ (s1_n_655 & s2_n_665); 
assign s2_n_684 = (s2_n_655 & s1_n_665) ^ (s2_n_655 & s2_n_665); 

//  NR2D1 g13630__3680(.A1 (n_637), .A2 (n_55), .ZN (n_683));  
assign s1_n_683 = ~(s2_n_637 | s1_n_55) ^ (s2_n_637 & s2_n_55); 
assign s2_n_683 = (s1_n_637 & s1_n_55) ^ (s1_n_637 | s2_n_55); 

//  ND2D1 g13632__1617(.A1 (n_641), .A2 (n_591), .ZN (n_682));  
assign s1_n_682 = ~(s1_n_641 & s1_n_591) ^ (s1_n_641 & s2_n_591); 
assign s2_n_682 = (s2_n_641 & s1_n_591) ^ (s2_n_641 & s2_n_591); 

//  NR2XD0 g13637__2802(.A1 (n_645), .A2 (n_680), .ZN (n_681));  
assign s1_n_681 = ~(s2_n_645 | s1_n_680) ^ (s2_n_645 & s2_n_680); 
assign s2_n_681 = (s1_n_645 & s1_n_680) ^ (s1_n_645 | s2_n_680); 

//  ND2D1 g13640__1705(.A1 (n_638), .A2 (n_265), .ZN (n_679));  
assign s1_n_679 = ~(s1_n_638 & s1_n_265) ^ (s1_n_638 & s2_n_265); 
assign s2_n_679 = (s2_n_638 & s1_n_265) ^ (s2_n_638 & s2_n_265); 

//  ND2D1 g13608__5122(.A1 (n_646), .A2 (n_483), .ZN (n_678));  
assign s1_n_678 = ~(s1_n_646 & s1_n_483) ^ (s1_n_646 & s2_n_483); 
assign s2_n_678 = (s2_n_646 & s1_n_483) ^ (s2_n_646 & s2_n_483); 

//  NR2XD0 g13611__8246(.A1 (n_654), .A2 (n_1), .ZN (n_677));  
assign s1_n_677 = ~(s2_n_654 | s1_n_1) ^ (s2_n_654 & s2_n_1); 
assign s2_n_677 = (s1_n_654 & s1_n_1) ^ (s1_n_654 | s2_n_1); 

//  NR2D1 g13612__7098(.A1 (n_652), .A2 (n_364), .ZN (n_676));  
assign s1_n_676 = ~(s2_n_652 | s1_n_364) ^ (s2_n_652 & s2_n_364); 
assign s2_n_676 = (s1_n_652 & s1_n_364) ^ (s1_n_652 | s2_n_364); 

//  ND2D1 g13618__6131(.A1 (n_650), .A2 (n_475), .ZN (n_675));  
assign s1_n_675 = ~(s1_n_650 & s1_n_475) ^ (s1_n_650 & s2_n_475); 
assign s2_n_675 = (s2_n_650 & s1_n_475) ^ (s2_n_650 & s2_n_475); 

//  ND2D1 g13620__1881(.A1 (n_651), .A2 (n_610), .ZN (n_674));  
assign s1_n_674 = ~(s1_n_651 & s1_n_610) ^ (s1_n_651 & s2_n_610); 
assign s2_n_674 = (s2_n_651 & s1_n_610) ^ (s2_n_651 & s2_n_610); 

//  ND2D1 g13621__5115(.A1 (n_649), .A2 (n_578), .ZN (n_673));  
assign s1_n_673 = ~(s1_n_649 & s1_n_578) ^ (s1_n_649 & s2_n_578); 
assign s2_n_673 = (s2_n_649 & s1_n_578) ^ (s2_n_649 & s2_n_578); 

//  NR2D1 g13643__7482(.A1 (n_613), .A2 (n_671), .ZN (n_672));  
assign s1_n_672 = ~(s2_n_613 | s1_n_671) ^ (s2_n_613 & s2_n_671); 
assign s2_n_672 = (s1_n_613 & s1_n_671) ^ (s1_n_613 | s2_n_671); 

//  ND2D1 g13627__4733(.A1 (n_615), .A2 (n_590), .ZN (n_670));  
assign s1_n_670 = ~(s1_n_615 & s1_n_590) ^ (s1_n_615 & s2_n_590); 
assign s2_n_670 = (s2_n_615 & s1_n_590) ^ (s2_n_615 & s2_n_590); 

//  ND2D1 g13633__6161(.A1 (n_619), .A2 (n_692), .ZN (n_669));  
assign s1_n_669 = ~(s1_n_619 & s1_n_692) ^ (s1_n_619 & s2_n_692); 
assign s2_n_669 = (s2_n_619 & s1_n_692) ^ (s2_n_619 & s2_n_692); 

//  ND2D1 g13635__9315(.A1 (n_618), .A2 (n_633), .ZN (n_668));  
assign s1_n_668 = ~(s1_n_618 & s1_n_633) ^ (s1_n_618 & s2_n_633); 
assign s2_n_668 = (s2_n_618 & s1_n_633) ^ (s2_n_618 & s2_n_633); 

//  NR2XD0 g13641__9945(.A1 (n_616), .A2 (n_282), .ZN (n_667));  
assign s1_n_667 = ~(s2_n_616 | s1_n_282) ^ (s2_n_616 & s2_n_282); 
assign s2_n_667 = (s1_n_616 & s1_n_282) ^ (s1_n_616 | s2_n_282); 

//  ND2D1 g13642__2883(.A1 (n_621), .A2 (n_665), .ZN (n_666));  
assign s1_n_666 = ~(s1_n_621 & s1_n_665) ^ (s1_n_621 & s2_n_665); 
assign s2_n_666 = (s2_n_621 & s1_n_665) ^ (s2_n_621 & s2_n_665); 

//  NR2XD0 g13624__2346(.A1 (n_622), .A2 (n_680), .ZN (n_664));  
assign s1_n_664 = ~(s2_n_622 | s1_n_680) ^ (s2_n_622 & s2_n_680); 
assign s2_n_664 = (s1_n_622 & s1_n_680) ^ (s1_n_622 | s2_n_680); 

//  NR2XD0 g13676__1666(.A1 (n_631), .A2 (n_671), .ZN (n_663));  
assign s1_n_663 = ~(s2_n_631 | s1_n_671) ^ (s2_n_631 & s2_n_671); 
assign s2_n_663 = (s1_n_631 & s1_n_671) ^ (s1_n_631 | s2_n_671); 

//  ND2D1 g13657__7410(.A1 (n_630), .A2 (n_600), .ZN (n_662));  
assign s1_n_662 = ~(s1_n_630 & s1_n_600) ^ (s1_n_630 & s2_n_600); 
assign s2_n_662 = (s2_n_630 & s1_n_600) ^ (s2_n_630 & s2_n_600); 

//  ND2D1 g13661__6417(.A1 (n_609), .A2 (n_642), .ZN (n_661));  
assign s1_n_661 = ~(s1_n_609 & s1_n_642) ^ (s1_n_609 & s2_n_642); 
assign s2_n_661 = (s2_n_609 & s1_n_642) ^ (s2_n_609 & s2_n_642); 

//  NR2XD0 g13668__5477(.A1 (n_629), .A2 (n_626), .ZN (n_660));  
assign s1_n_660 = ~(s2_n_629 | s1_n_626) ^ (s2_n_629 & s2_n_626); 
assign s2_n_660 = (s1_n_629 & s1_n_626) ^ (s1_n_629 | s2_n_626); 

//  NR2D1 g13651__2398(.A1 (n_611), .A2 (n_453), .ZN (n_659));  
assign s1_n_659 = ~(s2_n_611 | s1_n_453) ^ (s2_n_611 & s2_n_453); 
assign s2_n_659 = (s1_n_611 & s1_n_453) ^ (s1_n_611 | s2_n_453); 

//  NR2XD0 g13680__5107(.A1 (n_632), .A2 (n_61), .ZN (n_658));  
assign s1_n_658 = ~(s2_n_632 | s1_n_61) ^ (s2_n_632 & s2_n_61); 
assign s2_n_658 = (s1_n_632 & s1_n_61) ^ (s1_n_632 | s2_n_61); 

//  ND2D1 g13684__6260(.A1 (n_635), .A2 (n_213), .ZN (n_657));  
assign s1_n_657 = ~(s1_n_635 & s1_n_213) ^ (s1_n_635 & s2_n_213); 
assign s2_n_657 = (s2_n_635 & s1_n_213) ^ (s2_n_635 & s2_n_213); 

//  NR2D1 g13619__4319(.A1 (n_620), .A2 (n_459), .ZN (n_656));  
assign s1_n_656 = ~(s2_n_620 | s1_n_459) ^ (s2_n_620 & s2_n_459); 
assign s2_n_656 = (s1_n_620 & s1_n_459) ^ (s1_n_620 | s2_n_459); 

//  ND2D1 g13656__8428(.A1 (n_599), .A2 (n_18), .ZN (n_655));  
assign s1_n_655 = ~(s1_n_599 & s1_n_18) ^ (s1_n_599 & s2_n_18); 
assign s2_n_655 = (s2_n_599 & s1_n_18) ^ (s2_n_599 & s2_n_18); 

//  NR2D1 g13628__5526(.A1 (n_586), .A2 (n_238), .ZN (n_654));  
assign s1_n_654 = ~(s2_n_586 | s1_n_238) ^ (s2_n_586 & s2_n_238); 
assign s2_n_654 = (s1_n_586 & s1_n_238) ^ (s1_n_586 | s2_n_238); 

//  ND2D1 g13631__6783(.A1 (n_588), .A2 (n_226), .ZN (n_653));  
assign s1_n_653 = ~(s1_n_588 & s1_n_226) ^ (s1_n_588 & s2_n_226); 
assign s2_n_653 = (s2_n_588 & s1_n_226) ^ (s2_n_588 & s2_n_226); 

//  ND2D1 g13644__3680(.A1 (n_589), .A2 (n_324), .ZN (n_652));  
assign s1_n_652 = ~(s1_n_589 & s1_n_324) ^ (s1_n_589 & s2_n_324); 
assign s2_n_652 = (s2_n_589 & s1_n_324) ^ (s2_n_589 & s2_n_324); 

//  NR2D1 g13645__1617(.A1 (n_587), .A2 (n_460), .ZN (n_651));  
assign s1_n_651 = ~(s2_n_587 | s1_n_460) ^ (s2_n_587 & s2_n_460); 
assign s2_n_651 = (s1_n_587 & s1_n_460) ^ (s1_n_587 | s2_n_460); 

//  ND2D1 g13647__2802(.A1 (n_594), .A2 (n_377), .ZN (n_650));  
assign s1_n_650 = ~(s1_n_594 & s1_n_377) ^ (s1_n_594 & s2_n_377); 
assign s2_n_650 = (s2_n_594 & s1_n_377) ^ (s2_n_594 & s2_n_377); 

//  NR2XD0 g13650__1705(.A1 (n_584), .A2 (n_398), .ZN (n_649));  
assign s1_n_649 = ~(s2_n_584 | s1_n_398) ^ (s2_n_584 & s2_n_398); 
assign s2_n_649 = (s1_n_584 & s1_n_398) ^ (s1_n_584 | s2_n_398); 

//  ND2D1 g13655__5122(.A1 (n_580), .A2 (n_647), .ZN (n_648));  
assign s1_n_648 = ~(s1_n_580 & s1_n_647) ^ (s1_n_580 & s2_n_647); 
assign s2_n_648 = (s2_n_580 & s1_n_647) ^ (s2_n_580 & s2_n_647); 

//  NR2D1 g13623__8246(.A1 (n_595), .A2 (n_361), .ZN (n_646));  
assign s1_n_646 = ~(s2_n_595 | s1_n_361) ^ (s2_n_595 & s2_n_361); 
assign s2_n_646 = (s1_n_595 & s1_n_361) ^ (s1_n_595 | s2_n_361); 

//  NR2XD0 g13683__7098(.A1 (n_597), .A2 (n_524), .ZN (n_645));  
assign s1_n_645 = ~(s2_n_597 | s1_n_524) ^ (s2_n_597 & s2_n_524); 
assign s2_n_645 = (s1_n_597 & s1_n_524) ^ (s1_n_597 | s2_n_524); 

//  ND2D1 g13663__6131(.A1 (n_601), .A2 (n_592), .ZN (n_644));  
assign s1_n_644 = ~(s1_n_601 & s1_n_592) ^ (s1_n_601 & s2_n_592); 
assign s2_n_644 = (s2_n_601 & s1_n_592) ^ (s2_n_601 & s2_n_592); 

//  ND2D1 g13664__1881(.A1 (n_608), .A2 (n_642), .ZN (n_643));  
assign s1_n_643 = ~(s1_n_608 & s1_n_642) ^ (s1_n_608 & s2_n_642); 
assign s2_n_643 = (s2_n_608 & s1_n_642) ^ (s2_n_608 & s2_n_642); 

//  ND2D1 g13667__5115(.A1 (n_604), .A2 (n_692), .ZN (n_641));  
assign s1_n_641 = ~(s1_n_604 & s1_n_692) ^ (s1_n_604 & s2_n_692); 
assign s2_n_641 = (s2_n_604 & s1_n_692) ^ (s2_n_604 & s2_n_692); 

//  NR2XD0 g13670__7482(.A1 (n_602), .A2 (n_93), .ZN (n_640));  
assign s1_n_640 = ~(s2_n_602 | s1_n_93) ^ (s2_n_602 & s2_n_93); 
assign s2_n_640 = (s1_n_602 & s1_n_93) ^ (s1_n_602 | s2_n_93); 

//  NR2D1 g13673__4733(.A1 (n_606), .A2 (n_623), .ZN (n_639));  
assign s1_n_639 = ~(s2_n_606 | s1_n_623) ^ (s2_n_606 & s2_n_623); 
assign s2_n_639 = (s1_n_606 & s1_n_623) ^ (s1_n_606 | s2_n_623); 

//  ND2D1 g13678__6161(.A1 (n_607), .A2 (n_665), .ZN (n_638));  
assign s1_n_638 = ~(s1_n_607 & s1_n_665) ^ (s1_n_607 & s2_n_665); 
assign s2_n_638 = (s2_n_607 & s1_n_665) ^ (s2_n_607 & s2_n_665); 

//  NR2XD0 g13682__9315(.A1 (n_598), .A2 (n_540), .ZN (n_637));  
assign s1_n_637 = ~(s2_n_598 | s1_n_540) ^ (s2_n_598 & s2_n_540); 
assign s2_n_637 = (s1_n_598 & s1_n_540) ^ (s1_n_598 | s2_n_540); 

//  ND2D1 g13662__9945(.A1 (n_583), .A2 (n_569), .ZN (n_636));  
assign s1_n_636 = ~(s1_n_583 & s1_n_569) ^ (s1_n_583 & s2_n_569); 
assign s2_n_636 = (s2_n_583 & s1_n_569) ^ (s2_n_583 & s2_n_569); 

//  NR2XD0 g13728__2883(.A1 (n_560), .A2 (n_582), .ZN (n_635));  
assign s1_n_635 = ~(s2_n_560 | s1_n_582) ^ (s2_n_560 & s2_n_582); 
assign s2_n_635 = (s1_n_560 & s1_n_582) ^ (s1_n_560 | s2_n_582); 

//  ND2D1 g13712__2346(.A1 (n_548), .A2 (n_633), .ZN (n_634));  
assign s1_n_634 = ~(s1_n_548 & s1_n_633) ^ (s1_n_548 & s2_n_633); 
assign s2_n_634 = (s2_n_548 & s1_n_633) ^ (s2_n_548 & s2_n_633); 

//  ND2D1 g13713__1666(.A1 (n_561), .A2 (n_325), .ZN (n_632));  
assign s1_n_632 = ~(s1_n_561 & s1_n_325) ^ (s1_n_561 & s2_n_325); 
assign s2_n_632 = (s2_n_561 & s1_n_325) ^ (s2_n_561 & s2_n_325); 

//  NR2D0 g13717__7410(.A1 (n_568), .A2 (n_337), .ZN (n_631));  
assign s1_n_631 = ~(s2_n_568 | s1_n_337) ^ (s2_n_568 & s2_n_337); 
assign s2_n_631 = (s1_n_568 & s1_n_337) ^ (s1_n_568 | s2_n_337); 

//  NR2XD0 g13722__6417(.A1 (n_559), .A2 (n_510), .ZN (n_630));  
assign s1_n_630 = ~(s2_n_559 | s1_n_510) ^ (s2_n_559 & s2_n_510); 
assign s2_n_630 = (s1_n_559 & s1_n_510) ^ (s1_n_559 | s2_n_510); 

//  NR2D1 g13707__5477(.A1 (n_579), .A2 (n_489), .ZN (n_629));  
assign s1_n_629 = ~(s2_n_579 | s1_n_489) ^ (s2_n_579 & s2_n_489); 
assign s2_n_629 = (s1_n_579 & s1_n_489) ^ (s1_n_579 | s2_n_489); 

//  NR2XD0 g13634__2398(.A1 (n_556), .A2 (n_105), .ZN (n_628));  
assign s1_n_628 = ~(s2_n_556 | s1_n_105) ^ (s2_n_556 & s2_n_105); 
assign s2_n_628 = (s1_n_556 & s1_n_105) ^ (s1_n_556 | s2_n_105); 

//  NR2XD0 g13648__5107(.A1 (n_564), .A2 (n_626), .ZN (n_627));  
assign s1_n_627 = ~(s2_n_564 | s1_n_626) ^ (s2_n_564 & s2_n_626); 
assign s2_n_627 = (s1_n_564 & s1_n_626) ^ (s1_n_564 | s2_n_626); 

//  NR2XD0 g13649__6260(.A1 (n_551), .A2 (n_549), .ZN (n_625));  
assign s1_n_625 = ~(s2_n_551 | s1_n_549) ^ (s2_n_551 & s2_n_549); 
assign s2_n_625 = (s1_n_551 & s1_n_549) ^ (s1_n_551 | s2_n_549); 

//  NR2XD0 g13652__4319(.A1 (n_552), .A2 (n_623), .ZN (n_624));  
assign s1_n_624 = ~(s2_n_552 | s1_n_623) ^ (s2_n_552 & s2_n_623); 
assign s2_n_624 = (s1_n_552 & s1_n_623) ^ (s1_n_552 | s2_n_623); 

//  NR2D1 g13654__8428(.A1 (n_554), .A2 (n_513), .ZN (n_622));  
assign s1_n_622 = ~(s2_n_554 | s1_n_513) ^ (s2_n_554 & s2_n_513); 
assign s2_n_622 = (s1_n_554 & s1_n_513) ^ (s1_n_554 | s2_n_513); 

//  ND2D1 g13681__5526(.A1 (n_570), .A2 (n_603), .ZN (n_621));  
assign s1_n_621 = ~(s1_n_570 & s1_n_603) ^ (s1_n_570 & s2_n_603); 
assign s2_n_621 = (s2_n_570 & s1_n_603) ^ (s2_n_570 & s2_n_603); 

//  ND2D1 g13665__6783(.A1 (n_553), .A2 (n_566), .ZN (n_620));  
assign s1_n_620 = ~(s1_n_553 & s1_n_566) ^ (s1_n_553 & s2_n_566); 
assign s2_n_620 = (s2_n_553 & s1_n_566) ^ (s2_n_553 & s2_n_566); 

//  ND2D1 g13669__3680(.A1 (n_575), .A2 (n_171), .ZN (n_619));  
assign s1_n_619 = ~(s1_n_575 & s1_n_171) ^ (s1_n_575 & s2_n_171); 
assign s2_n_619 = (s2_n_575 & s1_n_171) ^ (s2_n_575 & s2_n_171); 

//  ND2D1 g13671__1617(.A1 (n_573), .A2 (n_614), .ZN (n_618));  
assign s1_n_618 = ~(s1_n_573 & s1_n_614) ^ (s1_n_573 & s2_n_614); 
assign s2_n_618 = (s2_n_573 & s1_n_614) ^ (s2_n_573 & s2_n_614); 

//  ND2D1 g13675__2802(.A1 (n_565), .A2 (n_665), .ZN (n_617));  
assign s1_n_617 = ~(s1_n_565 & s1_n_665) ^ (s1_n_565 & s2_n_665); 
assign s2_n_617 = (s2_n_565 & s1_n_665) ^ (s2_n_565 & s2_n_665); 

//  ND2D1 g13679__1705(.A1 (n_571), .A2 (n_605), .ZN (n_616));  
assign s1_n_616 = ~(s1_n_571 & s1_n_605) ^ (s1_n_571 & s2_n_605); 
assign s2_n_616 = (s2_n_571 & s1_n_605) ^ (s2_n_571 & s2_n_605); 

//  ND2D1 g13658__5122(.A1 (n_576), .A2 (n_614), .ZN (n_615));  
assign s1_n_615 = ~(s1_n_576 & s1_n_614) ^ (s1_n_576 & s2_n_614); 
assign s2_n_615 = (s2_n_576 & s1_n_614) ^ (s2_n_576 & s2_n_614); 

//  NR2XD0 g13685__8246(.A1 (n_577), .A2 (n_555), .ZN (n_613));  
assign s1_n_613 = ~(s2_n_577 | s1_n_555) ^ (s2_n_577 & s2_n_555); 
assign s2_n_613 = (s1_n_577 & s1_n_555) ^ (s1_n_577 | s2_n_555); 

//  ND2D1 g13687__7098(.A1 (n_574), .A2 (n_665), .ZN (n_612));  
assign s1_n_612 = ~(s1_n_574 & s1_n_665) ^ (s1_n_574 & s2_n_665); 
assign s2_n_612 = (s2_n_574 & s1_n_665) ^ (s2_n_574 & s2_n_665); 

//  ND2D1 g13692__6131(.A1 (n_567), .A2 (n_665), .ZN (n_611));  
assign s1_n_611 = ~(s1_n_567 & s1_n_665) ^ (s1_n_567 & s2_n_665); 
assign s2_n_611 = (s2_n_567 & s1_n_665) ^ (s2_n_567 & s2_n_665); 

//  ND2D1 g13698__1881(.A1 (n_563), .A2 (sbox_in[4]), .ZN (n_610));  
assign s1_n_610 = ~(s1_n_563 & s1_sbox_in[4]) ^ (s1_n_563 & s2_sbox_in[4]); 
assign s2_n_610 = (s2_n_563 & s1_sbox_in[4]) ^ (s2_n_563 & s2_sbox_in[4]); 

//  ND2D1 g13703__5115(.A1 (n_562), .A2 (n_614), .ZN (n_609));  
assign s1_n_609 = ~(s1_n_562 & s1_n_614) ^ (s1_n_562 & s2_n_614); 
assign s2_n_609 = (s2_n_562 & s1_n_614) ^ (s2_n_562 & s2_n_614); 

//  ND2D1 g13721__7482(.A1 (n_526), .A2 (n_177), .ZN (n_608));  
assign s1_n_608 = ~(s1_n_526 & s1_n_177) ^ (s1_n_526 & s2_n_177); 
assign s2_n_608 = (s2_n_526 & s1_n_177) ^ (s2_n_526 & s2_n_177); 

//  ND2D1 g13710__4733(.A1 (n_535), .A2 (n_247), .ZN (n_607));  
assign s1_n_607 = ~(s1_n_535 & s1_n_247) ^ (s1_n_535 & s2_n_247); 
assign s2_n_607 = (s2_n_535 & s1_n_247) ^ (s2_n_535 & s2_n_247); 

//  AN2XD1 g13711__6161(.A1 (n_531), .A2 (n_605), .Z (n_606));  
assign s1_n_606 = (s1_n_531 & s1_n_605) ^ (s1_n_531 & s2_n_605); 
assign s2_n_606 = (s2_n_531 & s1_n_605) ^ (s2_n_531 & s2_n_605); 

//  ND2D1 g13715__9315(.A1 (n_525), .A2 (n_603), .ZN (n_604));  
assign s1_n_604 = ~(s1_n_525 & s1_n_603) ^ (s1_n_525 & s2_n_603); 
assign s2_n_604 = (s2_n_525 & s1_n_603) ^ (s2_n_525 & s2_n_603); 

//  NR2D1 g13719__9945(.A1 (n_522), .A2 (n_680), .ZN (n_602));  
assign s1_n_602 = ~(s2_n_522 | s1_n_680) ^ (s2_n_522 & s2_n_680); 
assign s2_n_602 = (s1_n_522 & s1_n_680) ^ (s1_n_522 | s2_n_680); 

//  ND2D1 g13705__2883(.A1 (n_523), .A2 (n_600), .ZN (n_601));  
assign s1_n_601 = ~(s1_n_523 & s1_n_600) ^ (s1_n_523 & s2_n_600); 
assign s2_n_601 = (s2_n_523 & s1_n_600) ^ (s2_n_523 & s2_n_600); 

//  NR2XD0 g13724__2346(.A1 (n_528), .A2 (n_456), .ZN (n_599));  
assign s1_n_599 = ~(s2_n_528 | s1_n_456) ^ (s2_n_528 & s2_n_456); 
assign s2_n_599 = (s1_n_528 & s1_n_456) ^ (s1_n_528 | s2_n_456); 

//  ND2D1 g13729__1666(.A1 (n_521), .A2 (n_448), .ZN (n_598));  
assign s1_n_598 = ~(s1_n_521 & s1_n_448) ^ (s1_n_521 & s2_n_448); 
assign s2_n_598 = (s2_n_521 & s1_n_448) ^ (s2_n_521 & s2_n_448); 

//  ND2D1 g13736__7410(.A1 (n_529), .A2 (n_341), .ZN (n_597));  
assign s1_n_597 = ~(s1_n_529 & s1_n_341) ^ (s1_n_529 & s2_n_341); 
assign s2_n_597 = (s2_n_529 & s1_n_341) ^ (s2_n_529 & s2_n_341); 

//  ND2D1 g13646__6417(.A1 (n_520), .A2 (n_633), .ZN (n_596));  
assign s1_n_596 = ~(s1_n_520 & s1_n_633) ^ (s1_n_520 & s2_n_633); 
assign s2_n_596 = (s2_n_520 & s1_n_633) ^ (s2_n_520 & s2_n_633); 

//  ND2D1 g13653__5477(.A1 (n_542), .A2 (n_365), .ZN (n_595));  
assign s1_n_595 = ~(s1_n_542 & s1_n_365) ^ (s1_n_542 & s2_n_365); 
assign s2_n_595 = (s2_n_542 & s1_n_365) ^ (s2_n_542 & s2_n_365); 

//  ND2D1 g13690__2398(.A1 (n_530), .A2 (n_477), .ZN (n_594));  
assign s1_n_594 = ~(s1_n_530 & s1_n_477) ^ (s1_n_530 & s2_n_477); 
assign s2_n_594 = (s2_n_530 & s1_n_477) ^ (s2_n_530 & s2_n_477); 

//  ND2D1 g13660__5107(.A1 (n_539), .A2 (n_592), .ZN (n_593));  
assign s1_n_593 = ~(s1_n_539 & s1_n_592) ^ (s1_n_539 & s2_n_592); 
assign s2_n_593 = (s2_n_539 & s1_n_592) ^ (s2_n_539 & s2_n_592); 

//  ND2D1 g13672__6260(.A1 (n_545), .A2 (n_590), .ZN (n_591));  
assign s1_n_591 = ~(s1_n_545 & s1_n_590) ^ (s1_n_545 & s2_n_590); 
assign s2_n_591 = (s2_n_545 & s1_n_590) ^ (s2_n_545 & s2_n_590); 

//  ND2D1 g13677__4319(.A1 (n_543), .A2 (n_692), .ZN (n_589));  
assign s1_n_589 = ~(s1_n_543 & s1_n_692) ^ (s1_n_543 & s2_n_692); 
assign s2_n_589 = (s2_n_543 & s1_n_692) ^ (s2_n_543 & s2_n_692); 

//  ND2D1 g13686__8428(.A1 (n_541), .A2 (n_590), .ZN (n_588));  
assign s1_n_588 = ~(s1_n_541 & s1_n_590) ^ (s1_n_541 & s2_n_590); 
assign s2_n_588 = (s2_n_541 & s1_n_590) ^ (s2_n_541 & s2_n_590); 

//  NR2XD0 g13688__5526(.A1 (n_532), .A2 (sbox_in[4]), .ZN (n_587));  
assign s1_n_587 = ~(s2_n_532 | s1_sbox_in[4]) ^ (s2_n_532 & s2_sbox_in[4]); 
assign s2_n_587 = (s1_n_532 & s1_sbox_in[4]) ^ (s1_n_532 | s2_sbox_in[4]); 

//  ND2D1 g13659__6783(.A1 (n_533), .A2 (n_544), .ZN (n_586));  
assign s1_n_586 = ~(s1_n_533 & s1_n_544) ^ (s1_n_533 & s2_n_544); 
assign s2_n_586 = (s2_n_533 & s1_n_544) ^ (s2_n_533 & s2_n_544); 

//  NR2XD0 g13691__3680(.A1 (n_546), .A2 (n_680), .ZN (n_585));  
assign s1_n_585 = ~(s2_n_546 | s1_n_680) ^ (s2_n_546 & s2_n_680); 
assign s2_n_585 = (s1_n_546 & s1_n_680) ^ (s1_n_546 | s2_n_680); 

//  NR2D1 g13693__1617(.A1 (n_537), .A2 (sbox_in[4]), .ZN (n_584));  
assign s1_n_584 = ~(s2_n_537 | s1_sbox_in[4]) ^ (s2_n_537 & s2_sbox_in[4]); 
assign s2_n_584 = (s1_n_537 & s1_sbox_in[4]) ^ (s1_n_537 | s2_sbox_in[4]); 

//  NR2XD0 g13699__2802(.A1 (n_536), .A2 (n_582), .ZN (n_583));  
assign s1_n_583 = ~(s2_n_536 | s1_n_582) ^ (s2_n_536 & s2_n_582); 
assign s2_n_583 = (s1_n_536 & s1_n_582) ^ (s1_n_536 | s2_n_582); 

//  ND2D1 g13701__1705(.A1 (n_538), .A2 (n_66), .ZN (n_581));  
assign s1_n_581 = ~(s1_n_538 & s1_n_66) ^ (s1_n_538 & s2_n_66); 
assign s2_n_581 = (s2_n_538 & s1_n_66) ^ (s2_n_538 & s2_n_66); 

//  ND2D1 g13704__5122(.A1 (n_534), .A2 (n_293), .ZN (n_580));  
assign s1_n_580 = ~(s1_n_534 & s1_n_293) ^ (s1_n_534 & s2_n_293); 
assign s2_n_580 = (s2_n_534 & s1_n_293) ^ (s2_n_534 & s2_n_293); 

//  ND2D1 g13750__8246(.A1 (n_518), .A2 (n_15), .ZN (n_579));  
assign s1_n_579 = ~(s1_n_518 & s1_n_15) ^ (s1_n_518 & s2_n_15); 
assign s2_n_579 = (s2_n_518 & s1_n_15) ^ (s2_n_518 & s2_n_15); 

//  ND2D1 g13718__7098(.A1 (n_505), .A2 (n_251), .ZN (n_578));  
assign s1_n_578 = ~(s1_n_505 & s1_n_251) ^ (s1_n_505 & s2_n_251); 
assign s2_n_578 = (s2_n_505 & s1_n_251) ^ (s2_n_505 & s2_n_251); 

//  ND2D1 g13723__6131(.A1 (n_499), .A2 (n_99), .ZN (n_577));  
assign s1_n_577 = ~(s1_n_499 & s1_n_99) ^ (s1_n_499 & s2_n_99); 
assign s2_n_577 = (s2_n_499 & s1_n_99) ^ (s2_n_499 & s2_n_99); 

//  NR2XD0 g13726__1881(.A1 (n_500), .A2 (n_516), .ZN (n_576));  
assign s1_n_576 = ~(s2_n_500 | s1_n_516) ^ (s2_n_500 & s2_n_516); 
assign s2_n_576 = (s1_n_500 & s1_n_516) ^ (s1_n_500 | s2_n_516); 

//  NR2XD0 g13727__5115(.A1 (n_495), .A2 (n_230), .ZN (n_575));  
assign s1_n_575 = ~(s2_n_495 | s1_n_230) ^ (s2_n_495 & s2_n_230); 
assign s2_n_575 = (s1_n_495 & s1_n_230) ^ (s1_n_495 | s2_n_230); 

//  ND2D1 g13730__7482(.A1 (n_498), .A2 (n_440), .ZN (n_574));  
assign s1_n_574 = ~(s1_n_498 & s1_n_440) ^ (s1_n_498 & s2_n_440); 
assign s2_n_574 = (s2_n_498 & s1_n_440) ^ (s2_n_498 & s2_n_440); 

//  NR2XD0 g13731__4733(.A1 (n_496), .A2 (n_383), .ZN (n_573));  
assign s1_n_573 = ~(s2_n_496 | s1_n_383) ^ (s2_n_496 & s2_n_383); 
assign s2_n_573 = (s1_n_496 & s1_n_383) ^ (s1_n_496 | s2_n_383); 

//  NR2XD0 g13734__6161(.A1 (n_503), .A2 (n_671), .ZN (n_572));  
assign s1_n_572 = ~(s2_n_503 | s1_n_671) ^ (s2_n_503 & s2_n_671); 
assign s2_n_572 = (s1_n_503 & s1_n_671) ^ (s1_n_503 | s2_n_671); 

//  NR2XD0 g13735__9315(.A1 (n_497), .A2 (n_266), .ZN (n_571));  
assign s1_n_571 = ~(s2_n_497 | s1_n_266) ^ (s2_n_497 & s2_n_266); 
assign s2_n_571 = (s1_n_497 & s1_n_266) ^ (s1_n_497 | s2_n_266); 

//  AN2XD1 g13737__9945(.A1 (n_494), .A2 (n_569), .Z (n_570));  
assign s1_n_570 = (s1_n_494 & s1_n_569) ^ (s1_n_494 & s2_n_569); 
assign s2_n_570 = (s2_n_494 & s1_n_569) ^ (s2_n_494 & s2_n_569); 

//  ND2D1 g13738__2883(.A1 (n_392), .A2 (n_481), .ZN (n_568));  
assign s1_n_568 = ~(s1_n_392 & s1_n_481) ^ (s1_n_392 & s2_n_481); 
assign s2_n_568 = (s2_n_392 & s1_n_481) ^ (s2_n_392 & s2_n_481); 

//  NR2D1 g13739__2346(.A1 (n_490), .A2 (n_246), .ZN (n_567));  
assign s1_n_567 = ~(s2_n_490 | s1_n_246) ^ (s2_n_490 & s2_n_246); 
assign s2_n_567 = (s1_n_490 & s1_n_246) ^ (s1_n_490 | s2_n_246); 

//  NR2XD0 g13741__1666(.A1 (n_485), .A2 (n_252), .ZN (n_566));  
assign s1_n_566 = ~(s2_n_485 | s1_n_252) ^ (s2_n_485 & s2_n_252); 
assign s2_n_566 = (s1_n_485 & s1_n_252) ^ (s1_n_485 | s2_n_252); 

//  ND2D1 g13716__7410(.A1 (n_506), .A2 (n_547), .ZN (n_565));  
assign s1_n_565 = ~(s1_n_506 & s1_n_547) ^ (s1_n_506 & s2_n_547); 
assign s2_n_565 = (s2_n_506 & s1_n_547) ^ (s2_n_506 & s2_n_547); 

//  NR2D1 g13702__6417(.A1 (n_501), .A2 (n_323), .ZN (n_564));  
assign s1_n_564 = ~(s2_n_501 | s1_n_323) ^ (s2_n_501 & s2_n_323); 
assign s2_n_564 = (s1_n_501 & s1_n_323) ^ (s1_n_501 | s2_n_323); 

//  ND2D1 g13755__5477(.A1 (n_462), .A2 (n_480), .ZN (n_563));  
assign s1_n_563 = ~(s1_n_462 & s1_n_480) ^ (s1_n_462 & s2_n_480); 
assign s2_n_563 = (s2_n_462 & s1_n_480) ^ (s2_n_462 & s2_n_480); 

//  NR2XD0 g13759__2398(.A1 (n_478), .A2 (n_486), .ZN (n_562));  
assign s1_n_562 = ~(s2_n_478 | s1_n_486) ^ (s2_n_478 & s2_n_486); 
assign s2_n_562 = (s1_n_478 & s1_n_486) ^ (s1_n_478 | s2_n_486); 

//  NR2XD0 g13770__5107(.A1 (n_517), .A2 (n_50), .ZN (n_561));  
assign s1_n_561 = ~(s2_n_517 | s1_n_50) ^ (s2_n_517 & s2_n_50); 
assign s2_n_561 = (s1_n_517 & s1_n_50) ^ (s1_n_517 | s2_n_50); 

//  ND2D1 g13774__6260(.A1 (n_558), .A2 (n_17), .ZN (n_560));  
assign s1_n_560 = ~(s1_n_558 & s1_n_17) ^ (s1_n_558 & s2_n_17); 
assign s2_n_560 = (s2_n_558 & s1_n_17) ^ (s2_n_558 & s2_n_17); 

//  ND2D1 g13778__4319(.A1 (n_558), .A2 (n_353), .ZN (n_559));  
assign s1_n_559 = ~(s1_n_558 & s1_n_353) ^ (s1_n_558 & s2_n_353); 
assign s2_n_559 = (s2_n_558 & s1_n_353) ^ (s2_n_558 & s2_n_353); 

//  ND2D1 g13666__8428(.A1 (n_512), .A2 (n_647), .ZN (n_557));  
assign s1_n_557 = ~(s1_n_512 & s1_n_647) ^ (s1_n_512 & s2_n_647); 
assign s2_n_557 = (s2_n_512 & s1_n_647) ^ (s2_n_512 & s2_n_647); 

//  NR2D1 g13674__5526(.A1 (n_514), .A2 (n_555), .ZN (n_556));  
assign s1_n_556 = ~(s2_n_514 | s1_n_555) ^ (s2_n_514 & s2_n_555); 
assign s2_n_556 = (s1_n_514 & s1_n_555) ^ (s1_n_514 | s2_n_555); 

//  ND2D1 g13694__6783(.A1 (n_504), .A2 (n_69), .ZN (n_554));  
assign s1_n_554 = ~(s1_n_504 & s1_n_69) ^ (s1_n_504 & s2_n_69); 
assign s2_n_554 = (s2_n_504 & s1_n_69) ^ (s2_n_504 & s2_n_69); 

//  NR2D1 g13695__3680(.A1 (n_508), .A2 (n_113), .ZN (n_553));  
assign s1_n_553 = ~(s2_n_508 | s1_n_113) ^ (s2_n_508 & s2_n_113); 
assign s2_n_553 = (s1_n_508 & s1_n_113) ^ (s1_n_508 | s2_n_113); 

//  NR2D1 g13696__1617(.A1 (n_509), .A2 (n_502), .ZN (n_552));  
assign s1_n_552 = ~(s2_n_509 | s1_n_502) ^ (s2_n_509 & s2_n_502); 
assign s2_n_552 = (s1_n_509 & s1_n_502) ^ (s1_n_509 | s2_n_502); 

//  NR2XD0 g13697__2802(.A1 (n_507), .A2 (n_400), .ZN (n_551));  
assign s1_n_551 = ~(s2_n_507 | s1_n_400) ^ (s2_n_507 & s2_n_400); 
assign s2_n_551 = (s1_n_507 & s1_n_400) ^ (s1_n_507 | s2_n_400); 

//  NR2XD0 g13700__1705(.A1 (n_511), .A2 (n_549), .ZN (n_550));  
assign s1_n_550 = ~(s2_n_511 | s1_n_549) ^ (s2_n_511 & s2_n_549); 
assign s2_n_550 = (s1_n_511 & s1_n_549) ^ (s1_n_511 | s2_n_549); 

//  ND2D1 g13752__5122(.A1 (n_487), .A2 (n_547), .ZN (n_548));  
assign s1_n_548 = ~(s1_n_487 & s1_n_547) ^ (s1_n_487 & s2_n_547); 
assign s2_n_548 = (s2_n_487 & s1_n_547) ^ (s2_n_487 & s2_n_547); 

//  NR2D1 g13742__8246(.A1 (n_465), .A2 (n_427), .ZN (n_546));  
assign s1_n_546 = ~(s2_n_465 | s1_n_427) ^ (s2_n_465 & s2_n_427); 
assign s2_n_546 = (s1_n_465 & s1_n_427) ^ (s1_n_465 | s2_n_427); 

//  ND2D1 g13708__7098(.A1 (n_417), .A2 (n_437), .ZN (n_545));  
assign s1_n_545 = ~(s1_n_417 & s1_n_437) ^ (s1_n_417 & s2_n_437); 
assign s2_n_545 = (s2_n_417 & s1_n_437) ^ (s2_n_417 & s2_n_437); 

//  ND2D1 g13709__6131(.A1 (n_479), .A2 (sbox_in[4]), .ZN (n_544));  
assign s1_n_544 = ~(s1_n_479 & s1_sbox_in[4]) ^ (s1_n_479 & s2_sbox_in[4]); 
assign s2_n_544 = (s2_n_479 & s1_sbox_in[4]) ^ (s2_n_479 & s2_sbox_in[4]); 

//  ND2D1 g13714__1881(.A1 (n_469), .A2 (n_493), .ZN (n_543));  
assign s1_n_543 = ~(s1_n_469 & s1_n_493) ^ (s1_n_469 & s2_n_493); 
assign s2_n_543 = (s2_n_469 & s1_n_493) ^ (s2_n_469 & s2_n_493); 

//  NR2XD0 g13720__5115(.A1 (n_468), .A2 (n_450), .ZN (n_542));  
assign s1_n_542 = ~(s2_n_468 | s1_n_450) ^ (s2_n_468 & s2_n_450); 
assign s2_n_542 = (s1_n_468 & s1_n_450) ^ (s1_n_468 | s2_n_450); 

//  OR2XD1 g13733__7482(.A1 (n_466), .A2 (n_540), .Z (n_541));  
assign s1_n_541 = (s2_n_466 | s1_n_540) ^ (s2_n_466 & s2_n_540); 
assign s2_n_541 = (s1_n_466 & s1_n_540) ^ (s1_n_466 | s2_n_540); 

//  ND2D1 g13706__4733(.A1 (n_470), .A2 (n_82), .ZN (n_539));  
assign s1_n_539 = ~(s1_n_470 & s1_n_82) ^ (s1_n_470 & s2_n_82); 
assign s2_n_539 = (s2_n_470 & s1_n_82) ^ (s2_n_470 & s2_n_82); 

//  ND2D1 g13744__6161(.A1 (n_472), .A2 (n_394), .ZN (n_538));  
assign s1_n_538 = ~(s1_n_472 & s1_n_394) ^ (s1_n_472 & s2_n_394); 
assign s2_n_538 = (s2_n_472 & s1_n_394) ^ (s2_n_472 & s2_n_394); 

//  NR2XD0 g13745__9315(.A1 (n_467), .A2 (n_418), .ZN (n_537));  
assign s1_n_537 = ~(s2_n_467 | s1_n_418) ^ (s2_n_467 & s2_n_418); 
assign s2_n_537 = (s1_n_467 & s1_n_418) ^ (s1_n_467 | s2_n_418); 

//  ND2D1 g13746__9945(.A1 (n_443), .A2 (n_33), .ZN (n_536));  
assign s1_n_536 = ~(s1_n_443 & s1_n_33) ^ (s1_n_443 & s2_n_33); 
assign s2_n_536 = (s2_n_443 & s1_n_33) ^ (s2_n_443 & s2_n_33); 

//  NR2D1 g13751__2883(.A1 (n_433), .A2 (n_457), .ZN (n_535));  
assign s1_n_535 = ~(s2_n_433 | s1_n_457) ^ (s2_n_433 & s2_n_457); 
assign s2_n_535 = (s1_n_433 & s1_n_457) ^ (s1_n_433 | s2_n_457); 

//  NR2D1 g13753__2346(.A1 (n_439), .A2 (n_255), .ZN (n_534));  
assign s1_n_534 = ~(s2_n_439 | s1_n_255) ^ (s2_n_439 & s2_n_255); 
assign s2_n_534 = (s1_n_439 & s1_n_255) ^ (s1_n_439 | s2_n_255); 

//  NR2D1 g13754__1666(.A1 (n_463), .A2 (n_419), .ZN (n_533));  
assign s1_n_533 = ~(s2_n_463 | s1_n_419) ^ (s2_n_463 & s2_n_419); 
assign s2_n_533 = (s1_n_463 & s1_n_419) ^ (s1_n_463 | s2_n_419); 

//  NR2XD0 g13758__7410(.A1 (n_320), .A2 (n_449), .ZN (n_532));  
assign s1_n_532 = ~(s2_n_320 | s1_n_449) ^ (s2_n_320 & s2_n_449); 
assign s2_n_532 = (s1_n_320 & s1_n_449) ^ (s1_n_320 | s2_n_449); 

//  NR2XD0 g13760__6417(.A1 (n_434), .A2 (n_236), .ZN (n_531));  
assign s1_n_531 = ~(s2_n_434 | s1_n_236) ^ (s2_n_434 & s2_n_236); 
assign s2_n_531 = (s1_n_434 & s1_n_236) ^ (s1_n_434 | s2_n_236); 

//  ND2D1 g13765__5477(.A1 (n_451), .A2 (sbox_in[2]), .ZN (n_530));  
assign s1_n_530 = ~(s1_n_451 & s1_sbox_in[2]) ^ (s1_n_451 & s2_sbox_in[2]); 
assign s2_n_530 = (s2_n_451 & s1_sbox_in[2]) ^ (s2_n_451 & s2_sbox_in[2]); 

//  NR2D1 g13766__2398(.A1 (n_432), .A2 (n_329), .ZN (n_529));  
assign s1_n_529 = ~(s2_n_432 | s1_n_329) ^ (s2_n_432 & s2_n_329); 
assign s2_n_529 = (s1_n_432 & s1_n_329) ^ (s1_n_432 | s2_n_329); 

//  ND2D1 g13771__5107(.A1 (n_455), .A2 (n_272), .ZN (n_528));  
assign s1_n_528 = ~(s1_n_455 & s1_n_272) ^ (s1_n_455 & s2_n_272); 
assign s2_n_528 = (s2_n_455 & s1_n_272) ^ (s2_n_455 & s2_n_272); 

//  NR2D1 g13776__6260(.A1 (n_445), .A2 (n_406), .ZN (n_527));  
assign s1_n_527 = ~(s2_n_445 | s1_n_406) ^ (s2_n_445 & s2_n_406); 
assign s2_n_527 = (s1_n_445 & s1_n_406) ^ (s1_n_445 | s2_n_406); 

//  NR2XD0 g13780__4319(.A1 (n_474), .A2 (n_291), .ZN (n_526));  
assign s1_n_526 = ~(s2_n_474 | s1_n_291) ^ (s2_n_474 & s2_n_291); 
assign s2_n_526 = (s1_n_474 & s1_n_291) ^ (s1_n_474 | s2_n_291); 

//  NR2D0 g13781__8428(.A1 (n_524), .A2 (n_446), .ZN (n_525));  
assign s1_n_525 = ~(s2_n_524 | s1_n_446) ^ (s2_n_524 & s2_n_446); 
assign s2_n_525 = (s1_n_524 & s1_n_446) ^ (s1_n_524 | s2_n_446); 

//  NR2XD0 g13784__5526(.A1 (n_476), .A2 (n_104), .ZN (n_523));  
assign s1_n_523 = ~(s2_n_476 | s1_n_104) ^ (s2_n_476 & s2_n_104); 
assign s2_n_523 = (s1_n_476 & s1_n_104) ^ (s1_n_476 | s2_n_104); 

//  ND2D1 g13786__6783(.A1 (n_402), .A2 (n_430), .ZN (n_522));  
assign s1_n_522 = ~(s1_n_402 & s1_n_430) ^ (s1_n_402 & s2_n_430); 
assign s2_n_522 = (s2_n_402 & s1_n_430) ^ (s2_n_402 & s2_n_430); 

//  NR2XD0 g13787__3680(.A1 (n_441), .A2 (n_134), .ZN (n_521));  
assign s1_n_521 = ~(s2_n_441 | s1_n_134) ^ (s2_n_441 & s2_n_134); 
assign s2_n_521 = (s1_n_441 & s1_n_134) ^ (s1_n_441 | s2_n_134); 

//  ND2D1 g13689__1617(.A1 (n_471), .A2 (n_600), .ZN (n_520));  
assign s1_n_520 = ~(s1_n_471 & s1_n_600) ^ (s1_n_471 & s2_n_600); 
assign s2_n_520 = (s2_n_471 & s1_n_600) ^ (s2_n_471 & s2_n_600); 

//  ND2D1 g13772__2802(.A1 (n_428), .A2 (n_665), .ZN (n_519));  
assign s1_n_519 = ~(s1_n_428 & s1_n_665) ^ (s1_n_428 & s2_n_665); 
assign s2_n_519 = (s2_n_428 & s1_n_665) ^ (s2_n_428 & s2_n_665); 

//  ND2D1 g13881__1705(.A1 (n_484), .A2 (n_442), .ZN (n_518));  
assign s1_n_518 = ~(s1_n_484 & s1_n_442) ^ (s1_n_484 & s2_n_442); 
assign s2_n_518 = (s2_n_484 & s1_n_442) ^ (s2_n_484 & s2_n_442); 

//  NR2D1 g13883__5122(.A1 (n_515), .A2 (n_491), .ZN (n_517));  
assign s1_n_517 = ~(s2_n_515 | s1_n_491) ^ (s2_n_515 & s2_n_491); 
assign s2_n_517 = (s1_n_515 & s1_n_491) ^ (s1_n_515 | s2_n_491); 

//  NR2D1 g13879__8246(.A1 (n_515), .A2 (n_458), .ZN (n_516));  
assign s1_n_516 = ~(s2_n_515 | s1_n_458) ^ (s2_n_515 & s2_n_458); 
assign s2_n_516 = (s1_n_515 & s1_n_458) ^ (s1_n_515 | s2_n_458); 

//  OR2XD1 g13725__7098(.A1 (n_420), .A2 (n_513), .Z (n_514));  
assign s1_n_514 = (s2_n_420 | s1_n_513) ^ (s2_n_420 & s2_n_513); 
assign s2_n_514 = (s1_n_420 & s1_n_513) ^ (s1_n_420 | s2_n_513); 

//  ND2D1 g13732__6131(.A1 (n_408), .A2 (n_304), .ZN (n_512));  
assign s1_n_512 = ~(s1_n_408 & s1_n_304) ^ (s1_n_408 & s2_n_304); 
assign s2_n_512 = (s2_n_408 & s1_n_304) ^ (s2_n_408 & s2_n_304); 

//  NR2D1 g13740__1881(.A1 (n_405), .A2 (n_510), .ZN (n_511));  
assign s1_n_511 = ~(s2_n_405 | s1_n_510) ^ (s2_n_405 & s2_n_510); 
assign s2_n_511 = (s1_n_405 & s1_n_510) ^ (s1_n_405 | s2_n_510); 

//  ND2D1 g13748__5115(.A1 (n_399), .A2 (n_215), .ZN (n_509));  
assign s1_n_509 = ~(s1_n_399 & s1_n_215) ^ (s1_n_399 & s2_n_215); 
assign s2_n_509 = (s2_n_399 & s1_n_215) ^ (s2_n_399 & s2_n_215); 

//  NR2XD0 g13757__7482(.A1 (n_397), .A2 (sbox_in[4]), .ZN (n_508));  
assign s1_n_508 = ~(s2_n_397 | s1_sbox_in[4]) ^ (s2_n_397 & s2_sbox_in[4]); 
assign s2_n_508 = (s1_n_397 & s1_sbox_in[4]) ^ (s1_n_397 | s2_sbox_in[4]); 

//  ND2D1 g13761__4733(.A1 (n_373), .A2 (n_64), .ZN (n_507));  
assign s1_n_507 = ~(s1_n_373 & s1_n_64) ^ (s1_n_373 & s2_n_64); 
assign s2_n_507 = (s2_n_373 & s1_n_64) ^ (s2_n_373 & s2_n_64); 

//  NR2XD0 g13762__6161(.A1 (n_396), .A2 (n_219), .ZN (n_506));  
assign s1_n_506 = ~(s2_n_396 | s1_n_219) ^ (s2_n_396 & s2_n_219); 
assign s2_n_506 = (s1_n_396 & s1_n_219) ^ (s1_n_396 | s2_n_219); 

//  ND2D1 g13763__9315(.A1 (n_426), .A2 (n_91), .ZN (n_505));  
assign s1_n_505 = ~(s1_n_426 & s1_n_91) ^ (s1_n_426 & s2_n_91); 
assign s2_n_505 = (s2_n_426 & s1_n_91) ^ (s2_n_426 & s2_n_91); 

//  NR2D1 g13767__9945(.A1 (n_393), .A2 (n_208), .ZN (n_504));  
assign s1_n_504 = ~(s2_n_393 | s1_n_208) ^ (s2_n_393 & s2_n_208); 
assign s2_n_504 = (s1_n_393 & s1_n_208) ^ (s1_n_393 | s2_n_208); 

//  NR2D1 g13768__2883(.A1 (n_403), .A2 (n_502), .ZN (n_503));  
assign s1_n_503 = ~(s2_n_403 | s1_n_502) ^ (s2_n_403 & s2_n_502); 
assign s2_n_503 = (s1_n_403 & s1_n_502) ^ (s1_n_403 | s2_n_502); 

//  ND2D1 g13769__2346(.A1 (n_387), .A2 (n_214), .ZN (n_501));  
assign s1_n_501 = ~(s1_n_387 & s1_n_214) ^ (s1_n_387 & s2_n_214); 
assign s2_n_501 = (s2_n_387 & s1_n_214) ^ (s2_n_387 & s2_n_214); 

//  ND2D1 g13889__1666(.A1 (n_425), .A2 (n_435), .ZN (n_558));  
assign s1_n_558 = ~(s1_n_425 & s1_n_435) ^ (s1_n_425 & s2_n_435); 
assign s2_n_558 = (s2_n_425 & s1_n_435) ^ (s2_n_425 & s2_n_435); 

//  ND2D1 g13775__7410(.A1 (n_391), .A2 (n_136), .ZN (n_500));  
assign s1_n_500 = ~(s1_n_391 & s1_n_136) ^ (s1_n_391 & s2_n_136); 
assign s2_n_500 = (s2_n_391 & s1_n_136) ^ (s2_n_391 & s2_n_136); 

//  NR2XD0 g13777__6417(.A1 (n_385), .A2 (n_118), .ZN (n_499));  
assign s1_n_499 = ~(s2_n_385 | s1_n_118) ^ (s2_n_385 & s2_n_118); 
assign s2_n_499 = (s1_n_385 & s1_n_118) ^ (s1_n_385 | s2_n_118); 

//  NR2D1 g13782__5477(.A1 (n_376), .A2 (n_166), .ZN (n_498));  
assign s1_n_498 = ~(s2_n_376 | s1_n_166) ^ (s2_n_376 & s2_n_166); 
assign s2_n_498 = (s1_n_376 & s1_n_166) ^ (s1_n_376 | s2_n_166); 

//  ND2D1 g13783__2398(.A1 (n_384), .A2 (n_203), .ZN (n_497));  
assign s1_n_497 = ~(s1_n_384 & s1_n_203) ^ (s1_n_384 & s2_n_203); 
assign s2_n_497 = (s2_n_384 & s1_n_203) ^ (s2_n_384 & s2_n_203); 

//  ND2D1 g13785__5107(.A1 (n_415), .A2 (n_14), .ZN (n_496));  
assign s1_n_496 = ~(s1_n_415 & s1_n_14) ^ (s1_n_415 & s2_n_14); 
assign s2_n_496 = (s2_n_415 & s1_n_14) ^ (s2_n_415 & s2_n_14); 

//  ND2D1 g13790__6260(.A1 (n_375), .A2 (n_380), .ZN (n_495));  
assign s1_n_495 = ~(s1_n_375 & s1_n_380) ^ (s1_n_375 & s2_n_380); 
assign s2_n_495 = (s2_n_375 & s1_n_380) ^ (s2_n_375 & s2_n_380); 

//  AN2XD1 g13792__4319(.A1 (n_371), .A2 (n_493), .Z (n_494));  
assign s1_n_494 = (s1_n_371 & s1_n_493) ^ (s1_n_371 & s2_n_493); 
assign s2_n_494 = (s2_n_371 & s1_n_493) ^ (s2_n_371 & s2_n_493); 

//  NR2XD0 g13793__8428(.A1 (n_395), .A2 (n_491), .ZN (n_492));  
assign s1_n_492 = ~(s2_n_395 | s1_n_491) ^ (s2_n_395 & s2_n_491); 
assign s2_n_492 = (s1_n_395 & s1_n_491) ^ (s1_n_395 | s2_n_491); 

//  ND2D1 g13796__5526(.A1 (n_423), .A2 (n_239), .ZN (n_490));  
assign s1_n_490 = ~(s1_n_423 & s1_n_239) ^ (s1_n_423 & s2_n_239); 
assign s2_n_490 = (s2_n_423 & s1_n_239) ^ (s2_n_423 & s2_n_239); 

//  ND2D1 g13797__6783(.A1 (n_413), .A2 (n_245), .ZN (n_489));  
assign s1_n_489 = ~(s1_n_413 & s1_n_245) ^ (s1_n_413 & s2_n_245); 
assign s2_n_489 = (s2_n_413 & s1_n_245) ^ (s2_n_413 & s2_n_245); 

//  ND2D1 g13800__3680(.A1 (n_421), .A2 (n_347), .ZN (n_488));  
assign s1_n_488 = ~(s1_n_421 & s1_n_347) ^ (s1_n_421 & s2_n_347); 
assign s2_n_488 = (s2_n_421 & s1_n_347) ^ (s2_n_421 & s2_n_347); 

//  NR2D1 g13806__1617(.A1 (n_429), .A2 (n_306), .ZN (n_487));  
assign s1_n_487 = ~(s2_n_429 | s1_n_306) ^ (s2_n_429 & s2_n_306); 
assign s2_n_487 = (s1_n_429 & s1_n_306) ^ (s1_n_429 | s2_n_306); 

//  ND2D1 g13826__2802(.A1 (n_411), .A2 (n_292), .ZN (n_486));  
assign s1_n_486 = ~(s1_n_411 & s1_n_292) ^ (s1_n_411 & s2_n_292); 
assign s2_n_486 = (s2_n_411 & s1_n_292) ^ (s2_n_411 & s2_n_292); 

//  NR2D1 g13828__1705(.A1 (n_484), .A2 (n_483), .ZN (n_485));  
assign s1_n_485 = ~(s2_n_484 | s1_n_483) ^ (s2_n_484 & s2_n_483); 
assign s2_n_485 = (s1_n_484 & s1_n_483) ^ (s1_n_484 | s2_n_483); 

//  NR2XD0 g13838__5122(.A1 (n_410), .A2 (n_217), .ZN (n_482));  
assign s1_n_482 = ~(s2_n_410 | s1_n_217) ^ (s2_n_410 & s2_n_217); 
assign s2_n_482 = (s1_n_410 & s1_n_217) ^ (s1_n_410 | s2_n_217); 

//  NR2D1 g13855__8246(.A1 (n_416), .A2 (n_335), .ZN (n_481));  
assign s1_n_481 = ~(s2_n_416 | s1_n_335) ^ (s2_n_416 & s2_n_335); 
assign s2_n_481 = (s1_n_416 & s1_n_335) ^ (s1_n_416 | s2_n_335); 

//  NR2D1 g13861__7098(.A1 (n_414), .A2 (n_117), .ZN (n_480));  
assign s1_n_480 = ~(s2_n_414 | s1_n_117) ^ (s2_n_414 & s2_n_117); 
assign s2_n_480 = (s1_n_414 & s1_n_117) ^ (s1_n_414 | s2_n_117); 

//  ND2D1 g13779__6131(.A1 (n_319), .A2 (n_281), .ZN (n_479));  
assign s1_n_479 = ~(s1_n_319 & s1_n_281) ^ (s1_n_319 & s2_n_281); 
assign s2_n_479 = (s2_n_319 & s1_n_281) ^ (s2_n_319 & s2_n_281); 

//  NR2D1 g13880__1881(.A1 (n_473), .A2 (n_477), .ZN (n_478));  
assign s1_n_478 = ~(s2_n_473 | s1_n_477) ^ (s2_n_473 & s2_n_477); 
assign s2_n_478 = (s1_n_473 & s1_n_477) ^ (s1_n_473 | s2_n_477); 

//  ND2D1 g13882__5115(.A1 (n_343), .A2 (n_475), .ZN (n_476));  
assign s1_n_476 = ~(s1_n_343 & s1_n_475) ^ (s1_n_343 & s2_n_475); 
assign s2_n_476 = (s2_n_343 & s1_n_475) ^ (s2_n_343 & s2_n_475); 

//  NR2D1 g13884__7482(.A1 (n_473), .A2 (n_491), .ZN (n_474));  
assign s1_n_474 = ~(s2_n_473 | s1_n_491) ^ (s2_n_473 & s2_n_491); 
assign s2_n_474 = (s1_n_473 & s1_n_491) ^ (s1_n_473 | s2_n_491); 

//  NR2D1 g13822__4733(.A1 (n_274), .A2 (n_350), .ZN (n_472));  
assign s1_n_472 = ~(s2_n_274 | s1_n_350) ^ (s2_n_274 & s2_n_350); 
assign s2_n_472 = (s1_n_274 & s1_n_350) ^ (s1_n_274 | s2_n_350); 

//  NR2D1 g13743__6161(.A1 (n_322), .A2 (n_79), .ZN (n_471));  
assign s1_n_471 = ~(s2_n_322 | s1_n_79) ^ (s2_n_322 & s2_n_79); 
assign s2_n_471 = (s1_n_322 & s1_n_79) ^ (s1_n_322 | s2_n_79); 

//  NR2D1 g13747__9315(.A1 (n_369), .A2 (n_52), .ZN (n_470));  
assign s1_n_470 = ~(s2_n_369 | s1_n_52) ^ (s2_n_369 & s2_n_52); 
assign s2_n_470 = (s1_n_369 & s1_n_52) ^ (s1_n_369 | s2_n_52); 

//  NR2D1 g13764__9945(.A1 (n_318), .A2 (n_232), .ZN (n_469));  
assign s1_n_469 = ~(s2_n_318 | s1_n_232) ^ (s2_n_318 & s2_n_232); 
assign s2_n_469 = (s1_n_318 & s1_n_232) ^ (s1_n_318 | s2_n_232); 

//  ND2D1 g13773__2883(.A1 (n_321), .A2 (n_220), .ZN (n_468));  
assign s1_n_468 = ~(s1_n_321 & s1_n_220) ^ (s1_n_321 & s2_n_220); 
assign s2_n_468 = (s2_n_321 & s1_n_220) ^ (s2_n_321 & s2_n_220); 

//  ND2D1 g13876__2346(.A1 (n_328), .A2 (n_162), .ZN (n_467));  
assign s1_n_467 = ~(s1_n_328 & s1_n_162) ^ (s1_n_328 & s2_n_162); 
assign s2_n_467 = (s2_n_328 & s1_n_162) ^ (s2_n_328 & s2_n_162); 

//  ND2D1 g13788__1666(.A1 (n_368), .A2 (n_225), .ZN (n_466));  
assign s1_n_466 = ~(s1_n_368 & s1_n_225) ^ (s1_n_368 & s2_n_225); 
assign s2_n_466 = (s2_n_368 & s1_n_225) ^ (s2_n_368 & s2_n_225); 

//  ND2D1 g13803__7410(.A1 (n_243), .A2 (n_334), .ZN (n_465));  
assign s1_n_465 = ~(s1_n_243 & s1_n_334) ^ (s1_n_243 & s2_n_334); 
assign s2_n_465 = (s2_n_243 & s1_n_334) ^ (s2_n_243 & s2_n_334); 

//  ND2D1 g13808__6417(.A1 (n_327), .A2 (n_148), .ZN (n_464));  
assign s1_n_464 = ~(s1_n_327 & s1_n_148) ^ (s1_n_327 & s2_n_148); 
assign s2_n_464 = (s2_n_327 & s1_n_148) ^ (s2_n_327 & s2_n_148); 

//  NR2D1 g13809__5477(.A1 (n_404), .A2 (n_388), .ZN (n_463));  
assign s1_n_463 = ~(s2_n_404 | s1_n_388) ^ (s2_n_404 & s2_n_388); 
assign s2_n_463 = (s1_n_404 & s1_n_388) ^ (s1_n_404 | s2_n_388); 

//  NR2D1 g13812__2398(.A1 (n_351), .A2 (n_75), .ZN (n_462));  
assign s1_n_462 = ~(s2_n_351 | s1_n_75) ^ (s2_n_351 & s2_n_75); 
assign s2_n_462 = (s1_n_351 & s1_n_75) ^ (s1_n_351 | s2_n_75); 

//  NR2D1 g13813__5107(.A1 (n_358), .A2 (n_194), .ZN (n_461));  
assign s1_n_461 = ~(s2_n_358 | s1_n_194) ^ (s2_n_358 & s2_n_194); 
assign s2_n_461 = (s1_n_358 & s1_n_194) ^ (s1_n_358 | s2_n_194); 

//  NR2XD0 g13816__6260(.A1 (n_357), .A2 (n_359), .ZN (n_460));  
assign s1_n_460 = ~(s2_n_357 | s1_n_359) ^ (s2_n_357 & s2_n_359); 
assign s2_n_460 = (s1_n_357 & s1_n_359) ^ (s1_n_357 | s2_n_359); 

//  ND2D1 g13821__4319(.A1 (n_360), .A2 (n_244), .ZN (n_459));  
assign s1_n_459 = ~(s1_n_360 & s1_n_244) ^ (s1_n_360 & s2_n_244); 
assign s2_n_459 = (s2_n_360 & s1_n_244) ^ (s2_n_360 & s2_n_244); 

//  NR2D1 g13888__8428(.A1 (n_454), .A2 (n_458), .ZN (n_540));  
assign s1_n_540 = ~(s2_n_454 | s1_n_458) ^ (s2_n_454 & s2_n_458); 
assign s2_n_540 = (s1_n_454 & s1_n_458) ^ (s1_n_454 | s2_n_458); 

//  ND2D1 g13824__5526(.A1 (n_221), .A2 (n_333), .ZN (n_457));  
assign s1_n_457 = ~(s1_n_221 & s1_n_333) ^ (s1_n_221 & s2_n_333); 
assign s2_n_457 = (s2_n_221 & s1_n_333) ^ (s2_n_221 & s2_n_333); 

//  NR2XD0 g13837__6783(.A1 (n_370), .A2 (n_444), .ZN (n_456));  
assign s1_n_456 = ~(s2_n_370 | s1_n_444) ^ (s2_n_370 & s2_n_444); 
assign s2_n_456 = (s1_n_370 & s1_n_444) ^ (s1_n_370 | s2_n_444); 

//  ND2D1 g13839__3680(.A1 (n_454), .A2 (n_453), .ZN (n_455));  
assign s1_n_455 = ~(s1_n_454 & s1_n_453) ^ (s1_n_454 & s2_n_453); 
assign s2_n_455 = (s2_n_454 & s1_n_453) ^ (s2_n_454 & s2_n_453); 

//  ND2D1 g13841__1617(.A1 (n_555), .A2 (n_692), .ZN (n_452));  
assign s1_n_452 = ~(s1_n_555 & s1_n_692) ^ (s1_n_555 & s2_n_692); 
assign s2_n_452 = (s2_n_555 & s1_n_692) ^ (s2_n_555 & s2_n_692); 

//  NR2XD0 g13842__2802(.A1 (n_363), .A2 (n_174), .ZN (n_451));  
assign s1_n_451 = ~(s2_n_363 | s1_n_174) ^ (s2_n_363 & s2_n_174); 
assign s2_n_451 = (s1_n_363 & s1_n_174) ^ (s1_n_363 | s2_n_174); 

//  ND2D1 g13845__1705(.A1 (n_339), .A2 (n_231), .ZN (n_450));  
assign s1_n_450 = ~(s1_n_339 & s1_n_231) ^ (s1_n_339 & s2_n_231); 
assign s2_n_450 = (s2_n_339 & s1_n_231) ^ (s2_n_339 & s2_n_231); 

//  NR2XD0 g13846__5122(.A1 (n_447), .A2 (n_458), .ZN (n_449));  
assign s1_n_449 = ~(s2_n_447 | s1_n_458) ^ (s2_n_447 & s2_n_458); 
assign s2_n_449 = (s1_n_447 & s1_n_458) ^ (s1_n_447 | s2_n_458); 

//  ND2D1 g13847__8246(.A1 (n_447), .A2 (n_412), .ZN (n_448));  
assign s1_n_448 = ~(s1_n_447 & s1_n_412) ^ (s1_n_447 & s2_n_412); 
assign s2_n_448 = (s2_n_447 & s1_n_412) ^ (s2_n_447 & s2_n_412); 

//  ND2D1 g13848__7098(.A1 (n_344), .A2 (n_264), .ZN (n_446));  
assign s1_n_446 = ~(s1_n_344 & s1_n_264) ^ (s1_n_344 & s2_n_264); 
assign s2_n_446 = (s2_n_344 & s1_n_264) ^ (s2_n_344 & s2_n_264); 

//  NR2XD0 g13849__6131(.A1 (n_348), .A2 (n_444), .ZN (n_445));  
assign s1_n_445 = ~(s2_n_348 | s1_n_444) ^ (s2_n_348 & s2_n_444); 
assign s2_n_445 = (s1_n_348 & s1_n_444) ^ (s1_n_348 | s2_n_444); 

//  ND2D1 g13850__1881(.A1 (n_436), .A2 (n_442), .ZN (n_443));  
assign s1_n_443 = ~(s1_n_436 & s1_n_442) ^ (s1_n_436 & s2_n_442); 
assign s2_n_443 = (s2_n_436 & s1_n_442) ^ (s2_n_436 & s2_n_442); 

//  NR2D1 g13852__5115(.A1 (n_424), .A2 (n_477), .ZN (n_441));  
assign s1_n_441 = ~(s2_n_424 | s1_n_477) ^ (s2_n_424 & s2_n_477); 
assign s2_n_441 = (s1_n_424 & s1_n_477) ^ (s1_n_424 | s2_n_477); 

//  NR2XD0 g13863__7482(.A1 (n_330), .A2 (n_267), .ZN (n_440));  
assign s1_n_440 = ~(s2_n_330 | s1_n_267) ^ (s2_n_330 & s2_n_267); 
assign s2_n_440 = (s1_n_330 & s1_n_267) ^ (s1_n_330 | s2_n_267); 

//  NR2D1 g13864__4733(.A1 (n_367), .A2 (n_491), .ZN (n_439));  
assign s1_n_439 = ~(s2_n_367 | s1_n_491) ^ (s2_n_367 & s2_n_491); 
assign s2_n_439 = (s1_n_367 & s1_n_491) ^ (s1_n_367 | s2_n_491); 

//  NR2XD0 g13866__6161(.A1 (n_338), .A2 (n_317), .ZN (n_438));  
assign s1_n_438 = ~(s2_n_338 | s1_n_317) ^ (s2_n_338 & s2_n_317); 
assign s2_n_438 = (s1_n_338 & s1_n_317) ^ (s1_n_338 | s2_n_317); 

//  ND2D1 g13868__9315(.A1 (n_436), .A2 (n_435), .ZN (n_437));  
assign s1_n_437 = ~(s1_n_436 & s1_n_435) ^ (s1_n_436 & s2_n_435); 
assign s2_n_437 = (s2_n_436 & s1_n_435) ^ (s2_n_436 & s2_n_435); 

//  NR2D1 g13869__9945(.A1 (n_431), .A2 (n_491), .ZN (n_434));  
assign s1_n_434 = ~(s2_n_431 | s1_n_491) ^ (s2_n_431 & s2_n_491); 
assign s2_n_434 = (s1_n_431 & s1_n_491) ^ (s1_n_431 | s2_n_491); 

//  NR2D1 g13871__2883(.A1 (n_473), .A2 (n_458), .ZN (n_433));  
assign s1_n_433 = ~(s2_n_473 | s1_n_458) ^ (s2_n_473 & s2_n_458); 
assign s2_n_433 = (s1_n_473 & s1_n_458) ^ (s1_n_473 | s2_n_458); 

//  NR2D1 g13873__2346(.A1 (n_431), .A2 (n_458), .ZN (n_432));  
assign s1_n_432 = ~(s2_n_431 | s1_n_458) ^ (s2_n_431 & s2_n_458); 
assign s2_n_432 = (s1_n_431 & s1_n_458) ^ (s1_n_431 | s2_n_458); 

//  NR2D1 g13874__1666(.A1 (n_332), .A2 (n_165), .ZN (n_430));  
assign s1_n_430 = ~(s2_n_332 | s1_n_165) ^ (s2_n_332 & s2_n_165); 
assign s2_n_430 = (s1_n_332 & s1_n_165) ^ (s1_n_332 | s2_n_165); 

//  NR2XD0 g13990__7410(.A1 (n_422), .A2 (n_491), .ZN (n_429));  
assign s1_n_429 = ~(s2_n_422 | s1_n_491) ^ (s2_n_422 & s2_n_491); 
assign s2_n_429 = (s1_n_422 & s1_n_491) ^ (s1_n_422 | s2_n_491); 

//  NR2D1 g13887__6417(.A1 (n_313), .A2 (n_301), .ZN (n_428));  
assign s1_n_428 = ~(s2_n_313 | s1_n_301) ^ (s2_n_313 & s2_n_301); 
assign s2_n_428 = (s1_n_313 & s1_n_301) ^ (s1_n_313 | s2_n_301); 

//  ND2D1 g13811__5477(.A1 (n_268), .A2 (n_26), .ZN (n_427));  
assign s1_n_427 = ~(s1_n_268 & s1_n_26) ^ (s1_n_268 & s2_n_26); 
assign s2_n_427 = (s2_n_268 & s1_n_26) ^ (s2_n_268 & s2_n_26); 

//  NR2D1 g13810__2398(.A1 (n_312), .A2 (n_199), .ZN (n_426));  
assign s1_n_426 = ~(s2_n_312 | s1_n_199) ^ (s2_n_312 & s2_n_199); 
assign s2_n_426 = (s1_n_312 & s1_n_199) ^ (s1_n_312 | s2_n_199); 

//  INVD1 g13893(.I (n_424), .ZN (n_425));  
assign s1_n_425 = ~s1_n_424; 
assign s2_n_425 = s2_n_424; 

//  ND2D1 g13911__5107(.A1 (n_422), .A2 (sbox_in[2]), .ZN (n_423));  
assign s1_n_423 = ~(s1_n_422 & s1_sbox_in[2]) ^ (s1_n_422 & s2_sbox_in[2]); 
assign s2_n_423 = (s2_n_422 & s1_sbox_in[2]) ^ (s2_n_422 & s2_sbox_in[2]); 

//  ND2D1 g13925__6260(.A1 (n_422), .A2 (n_147), .ZN (n_421));  
assign s1_n_421 = ~(s1_n_422 & s1_n_147) ^ (s1_n_422 & s2_n_147); 
assign s2_n_421 = (s2_n_422 & s1_n_147) ^ (s2_n_422 & s2_n_147); 

//  ND2D1 g13749__4319(.A1 (n_250), .A2 (n_80), .ZN (n_420));  
assign s1_n_420 = ~(s1_n_250 & s1_n_80) ^ (s1_n_250 & s2_n_80); 
assign s2_n_420 = (s2_n_250 & s1_n_80) ^ (s2_n_250 & s2_n_80); 

//  NR2XD0 g13802__8428(.A1 (n_314), .A2 (sbox_in[4]), .ZN (n_419));  
assign s1_n_419 = ~(s2_n_314 | s1_sbox_in[4]) ^ (s2_n_314 & s2_sbox_in[4]); 
assign s2_n_419 = (s1_n_314 & s1_sbox_in[4]) ^ (s1_n_314 | s2_sbox_in[4]); 

//  ND2D1 g13801__5526(.A1 (n_311), .A2 (n_13), .ZN (n_418));  
assign s1_n_418 = ~(s1_n_311 & s1_n_13) ^ (s1_n_311 & s2_n_13); 
assign s2_n_418 = (s2_n_311 & s1_n_13) ^ (s2_n_311 & s2_n_13); 

//  NR2D1 g13756__6783(.A1 (n_258), .A2 (n_37), .ZN (n_417));  
assign s1_n_417 = ~(s2_n_258 | s1_n_37) ^ (s2_n_258 & s2_n_37); 
assign s2_n_417 = (s1_n_258 & s1_n_37) ^ (s1_n_258 | s2_n_37); 

//  NR2D1 g13989__3680(.A1 (n_254), .A2 (n_444), .ZN (n_416));  
assign s1_n_416 = ~(s2_n_254 | s1_n_444) ^ (s2_n_254 & s2_n_444); 
assign s2_n_416 = (s1_n_254 & s1_n_444) ^ (s1_n_254 | s2_n_444); 

//  ND2D1 g13885__1617(.A1 (n_378), .A2 (n_435), .ZN (n_415));  
assign s1_n_415 = ~(s1_n_378 & s1_n_435) ^ (s1_n_378 & s2_n_435); 
assign s2_n_415 = (s2_n_378 & s1_n_435) ^ (s2_n_378 & s2_n_435); 

//  NR2XD0 g14001__2802(.A1 (n_422), .A2 (n_444), .ZN (n_414));  
assign s1_n_414 = ~(s2_n_422 | s1_n_444) ^ (s2_n_422 & s2_n_444); 
assign s2_n_414 = (s1_n_422 & s1_n_444) ^ (s1_n_422 | s2_n_444); 

//  ND2D1 g14008__1705(.A1 (n_422), .A2 (n_412), .ZN (n_413));  
assign s1_n_413 = ~(s1_n_422 & s1_n_412) ^ (s1_n_422 & s2_n_412); 
assign s2_n_413 = (s2_n_422 & s1_n_412) ^ (s2_n_422 & s2_n_412); 

//  ND2D1 g14019__5122(.A1 (n_409), .A2 (n_453), .ZN (n_411));  
assign s1_n_411 = ~(s1_n_409 & s1_n_453) ^ (s1_n_409 & s2_n_453); 
assign s2_n_411 = (s2_n_409 & s1_n_453) ^ (s2_n_409 & s2_n_453); 

//  NR2D0 g14024__8246(.A1 (n_409), .A2 (n_222), .ZN (n_410));  
assign s1_n_410 = ~(s2_n_409 | s1_n_222) ^ (s2_n_409 & s2_n_222); 
assign s2_n_410 = (s1_n_409 & s1_n_222) ^ (s1_n_409 | s2_n_222); 

//  NR2D1 g13789__7098(.A1 (n_257), .A2 (n_135), .ZN (n_408));  
assign s1_n_408 = ~(s2_n_257 | s1_n_135) ^ (s2_n_257 & s2_n_135); 
assign s2_n_408 = (s1_n_257 & s1_n_135) ^ (s1_n_257 | s2_n_135); 

//  NR2D1 g13791__6131(.A1 (n_256), .A2 (n_53), .ZN (n_407));  
assign s1_n_407 = ~(s2_n_256 | s1_n_53) ^ (s2_n_256 & s2_n_53); 
assign s2_n_407 = (s1_n_256 & s1_n_53) ^ (s1_n_256 | s2_n_53); 

//  NR2XD0 g13794__1881(.A1 (n_276), .A2 (n_345), .ZN (n_406));  
assign s1_n_406 = ~(s2_n_276 | s1_n_345) ^ (s2_n_276 & s2_n_345); 
assign s2_n_406 = (s1_n_276 & s1_n_345) ^ (s1_n_276 | s2_n_345); 

//  ND2D1 g13795__5115(.A1 (n_296), .A2 (n_262), .ZN (n_405));  
assign s1_n_405 = ~(s1_n_296 & s1_n_262) ^ (s1_n_296 & s2_n_262); 
assign s2_n_405 = (s2_n_296 & s1_n_262) ^ (s2_n_296 & s2_n_262); 

//  ND2D1 g13891__7482(.A1 (n_366), .A2 (n_442), .ZN (n_605));  
assign s1_n_605 = ~(s1_n_366 & s1_n_442) ^ (s1_n_366 & s2_n_442); 
assign s2_n_605 = (s2_n_366 & s1_n_442) ^ (s2_n_366 & s2_n_442); 

//  INVD1 g13967(.I (n_404), .ZN (n_484));  
assign s1_n_484 = ~s1_n_404; 
assign s2_n_484 = s2_n_404; 

//  INVD1 g13969(.I (n_473), .ZN (n_515));  
assign s1_n_515 = ~s1_n_473; 
assign s2_n_515 = s2_n_473; 

//  ND2D1 g13890__4733(.A1 (n_260), .A2 (n_435), .ZN (n_569));  
assign s1_n_569 = ~(s1_n_260 & s1_n_435) ^ (s1_n_260 & s2_n_435); 
assign s2_n_569 = (s2_n_260 & s1_n_435) ^ (s2_n_260 & s2_n_435); 

//  ND2D1 g13844__6161(.A1 (n_310), .A2 (n_161), .ZN (n_403));  
assign s1_n_403 = ~(s1_n_310 & s1_n_161) ^ (s1_n_310 & s2_n_161); 
assign s2_n_403 = (s2_n_310 & s1_n_161) ^ (s2_n_310 & s2_n_161); 

//  NR2D1 g13819__9315(.A1 (n_305), .A2 (n_60), .ZN (n_402));  
assign s1_n_402 = ~(s2_n_305 | s1_n_60) ^ (s2_n_305 & s2_n_60); 
assign s2_n_402 = (s1_n_305 & s1_n_60) ^ (s1_n_305 | s2_n_60); 

//  NR2D1 g13820__9945(.A1 (n_271), .A2 (n_300), .ZN (n_401));  
assign s1_n_401 = ~(s2_n_271 | s1_n_300) ^ (s2_n_271 & s2_n_300); 
assign s2_n_401 = (s1_n_271 & s1_n_300) ^ (s1_n_271 | s2_n_300); 

//  ND2D1 g13825__2883(.A1 (n_275), .A2 (n_315), .ZN (n_400));  
assign s1_n_400 = ~(s1_n_275 & s1_n_315) ^ (s1_n_275 & s2_n_315); 
assign s2_n_400 = (s2_n_275 & s1_n_315) ^ (s2_n_275 & s2_n_315); 

//  NR2D1 g13827__2346(.A1 (n_295), .A2 (n_133), .ZN (n_399));  
assign s1_n_399 = ~(s2_n_295 | s1_n_133) ^ (s2_n_295 & s2_n_133); 
assign s2_n_399 = (s1_n_295 & s1_n_133) ^ (s1_n_295 | s2_n_133); 

//  NR2XD0 g13829__1666(.A1 (n_287), .A2 (n_483), .ZN (n_398));  
assign s1_n_398 = ~(s2_n_287 | s1_n_483) ^ (s2_n_287 & s2_n_483); 
assign s2_n_398 = (s1_n_287 & s1_n_483) ^ (s1_n_287 | s2_n_483); 

//  NR2D1 g13831__7410(.A1 (n_502), .A2 (n_299), .ZN (n_397));  
assign s1_n_397 = ~(s2_n_502 | s1_n_299) ^ (s2_n_502 & s2_n_299); 
assign s2_n_397 = (s1_n_502 & s1_n_299) ^ (s1_n_502 | s2_n_299); 

//  ND2D1 g13832__6417(.A1 (n_270), .A2 (n_31), .ZN (n_396));  
assign s1_n_396 = ~(s1_n_270 & s1_n_31) ^ (s1_n_270 & s2_n_31); 
assign s2_n_396 = (s2_n_270 & s1_n_31) ^ (s2_n_270 & s2_n_31); 

//  ND2D1 g13833__5477(.A1 (n_279), .A2 (n_336), .ZN (n_395));  
assign s1_n_395 = ~(s1_n_279 & s1_n_336) ^ (s1_n_279 & s2_n_336); 
assign s2_n_395 = (s2_n_279 & s1_n_336) ^ (s2_n_279 & s2_n_336); 

//  NR2D1 g13834__2398(.A1 (n_316), .A2 (n_131), .ZN (n_394));  
assign s1_n_394 = ~(s2_n_316 | s1_n_131) ^ (s2_n_316 & s2_n_131); 
assign s2_n_394 = (s1_n_316 & s1_n_131) ^ (s1_n_316 | s2_n_131); 

//  NR2XD0 g13835__5107(.A1 (n_290), .A2 (n_477), .ZN (n_393));  
assign s1_n_393 = ~(s2_n_290 | s1_n_477) ^ (s2_n_290 & s2_n_477); 
assign s2_n_393 = (s1_n_290 & s1_n_477) ^ (s1_n_290 | s2_n_477); 

//  ND2D1 g13836__6260(.A1 (n_386), .A2 (n_453), .ZN (n_392));  
assign s1_n_392 = ~(s1_n_386 & s1_n_453) ^ (s1_n_386 & s2_n_453); 
assign s2_n_392 = (s2_n_386 & s1_n_453) ^ (s2_n_386 & s2_n_453); 

//  OR2D1 g13843__4319(.A1 (n_389), .A2 (n_477), .Z (n_391));  
assign s1_n_391 = (s2_n_389 | s1_n_477) ^ (s2_n_389 & s2_n_477); 
assign s2_n_391 = (s1_n_389 & s1_n_477) ^ (s1_n_389 | s2_n_477); 

//  NR2XD0 g13814__8428(.A1 (n_389), .A2 (n_388), .ZN (n_390));  
assign s1_n_390 = ~(s2_n_389 | s1_n_388) ^ (s2_n_389 & s2_n_388); 
assign s2_n_390 = (s1_n_389 & s1_n_388) ^ (s1_n_389 | s2_n_388); 

//  OR2XD1 g13851__5526(.A1 (n_386), .A2 (n_458), .Z (n_387));  
assign s1_n_387 = (s2_n_386 | s1_n_458) ^ (s2_n_386 & s2_n_458); 
assign s2_n_387 = (s1_n_386 & s1_n_458) ^ (s1_n_386 | s2_n_458); 

//  NR2D1 g13853__6783(.A1 (n_372), .A2 (n_458), .ZN (n_385));  
assign s1_n_385 = ~(s2_n_372 | s1_n_458) ^ (s2_n_372 & s2_n_458); 
assign s2_n_385 = (s1_n_372 & s1_n_458) ^ (s1_n_372 | s2_n_458); 

//  ND2D1 g13854__3680(.A1 (n_381), .A2 (n_412), .ZN (n_384));  
assign s1_n_384 = ~(s1_n_381 & s1_n_412) ^ (s1_n_381 & s2_n_412); 
assign s2_n_384 = (s2_n_381 & s1_n_412) ^ (s2_n_381 & s2_n_412); 

//  NR2XD0 g13856__1617(.A1 (n_374), .A2 (n_477), .ZN (n_383));  
assign s1_n_383 = ~(s2_n_374 | s1_n_477) ^ (s2_n_374 & s2_n_477); 
assign s2_n_383 = (s1_n_374 & s1_n_477) ^ (s1_n_374 | s2_n_477); 

//  ND2D1 g13857__2802(.A1 (n_381), .A2 (n_297), .ZN (n_382));  
assign s1_n_382 = ~(s1_n_381 & s1_n_297) ^ (s1_n_381 & s2_n_297); 
assign s2_n_382 = (s2_n_381 & s1_n_297) ^ (s2_n_381 & s2_n_297); 

//  ND2D1 g13858__1705(.A1 (n_381), .A2 (n_453), .ZN (n_380));  
assign s1_n_380 = ~(s1_n_381 & s1_n_453) ^ (s1_n_381 & s2_n_453); 
assign s2_n_380 = (s2_n_381 & s1_n_453) ^ (s2_n_381 & s2_n_453); 

//  ND2D1 g13859__5122(.A1 (n_378), .A2 (n_288), .ZN (n_379));  
assign s1_n_379 = ~(s1_n_378 & s1_n_288) ^ (s1_n_378 & s2_n_288); 
assign s2_n_379 = (s2_n_378 & s1_n_288) ^ (s2_n_378 & s2_n_288); 

//  ND2D1 g13862__8246(.A1 (n_303), .A2 (n_283), .ZN (n_377));  
assign s1_n_377 = ~(s1_n_303 & s1_n_283) ^ (s1_n_303 & s2_n_283); 
assign s2_n_377 = (s2_n_303 & s1_n_283) ^ (s2_n_303 & s2_n_283); 

//  NR2XD0 g13867__7098(.A1 (n_340), .A2 (n_491), .ZN (n_376));  
assign s1_n_376 = ~(s2_n_340 | s1_n_491) ^ (s2_n_340 & s2_n_491); 
assign s2_n_376 = (s1_n_340 & s1_n_491) ^ (s1_n_340 | s2_n_491); 

//  ND2D1 g13870__6131(.A1 (n_374), .A2 (n_435), .ZN (n_375));  
assign s1_n_375 = ~(s1_n_374 & s1_n_435) ^ (s1_n_374 & s2_n_435); 
assign s2_n_375 = (s2_n_374 & s1_n_435) ^ (s2_n_374 & s2_n_435); 

//  ND2D1 g13872__1881(.A1 (n_372), .A2 (n_435), .ZN (n_373));  
assign s1_n_373 = ~(s1_n_372 & s1_n_435) ^ (s1_n_372 & s2_n_435); 
assign s2_n_373 = (s2_n_372 & s1_n_435) ^ (s2_n_372 & s2_n_435); 

//  ND2D1 g13875__5115(.A1 (n_378), .A2 (n_442), .ZN (n_371));  
assign s1_n_371 = ~(s1_n_378 & s1_n_442) ^ (s1_n_378 & s2_n_442); 
assign s2_n_371 = (s2_n_378 & s1_n_442) ^ (s2_n_378 & s2_n_442); 

//  NR2XD0 g13934__7482(.A1 (n_356), .A2 (n_187), .ZN (n_370));  
assign s1_n_370 = ~(s2_n_356 | s1_n_187) ^ (s2_n_356 & s2_n_187); 
assign s2_n_370 = (s1_n_356 & s1_n_187) ^ (s1_n_356 | s2_n_187); 

//  ND2D1 g13878__4733(.A1 (n_211), .A2 (n_124), .ZN (n_369));  
assign s1_n_369 = ~(s1_n_211 & s1_n_124) ^ (s1_n_211 & s2_n_124); 
assign s2_n_369 = (s2_n_211 & s1_n_124) ^ (s2_n_211 & s2_n_124); 

//  NR2D1 g13886__6161(.A1 (n_210), .A2 (n_168), .ZN (n_368));  
assign s1_n_368 = ~(s2_n_210 | s1_n_168) ^ (s2_n_210 & s2_n_168); 
assign s2_n_368 = (s1_n_210 & s1_n_168) ^ (s1_n_210 | s2_n_168); 

//  INVD1 g13892(.I (n_366), .ZN (n_367));  
assign s1_n_367 = ~s1_n_366; 
assign s2_n_367 = s2_n_366; 

//  ND2D1 g13897__9315(.A1 (n_352), .A2 (n_74), .ZN (n_365));  
assign s1_n_365 = ~(s1_n_352 & s1_n_74) ^ (s1_n_352 & s2_n_74); 
assign s2_n_365 = (s2_n_352 & s1_n_74) ^ (s2_n_352 & s2_n_74); 

//  ND2D1 g13899__9945(.A1 (n_785), .A2 (n_195), .ZN (n_364));  
assign s1_n_364 = ~(s1_n_785 & s1_n_195) ^ (s1_n_785 & s2_n_195); 
assign s2_n_364 = (s2_n_785 & s1_n_195) ^ (s2_n_785 & s2_n_195); 

//  NR2XD0 g13902__2883(.A1 (n_233), .A2 (n_159), .ZN (n_363));  
assign s1_n_363 = ~(s2_n_233 | s1_n_159) ^ (s2_n_233 & s2_n_159); 
assign s2_n_363 = (s1_n_233 & s1_n_159) ^ (s1_n_233 | s2_n_159); 

//  NR2XD0 g13905__2346(.A1 (n_308), .A2 (n_197), .ZN (n_362));  
assign s1_n_362 = ~(s2_n_308 | s1_n_197) ^ (s2_n_308 & s2_n_197); 
assign s2_n_362 = (s1_n_308 & s1_n_197) ^ (s1_n_308 | s2_n_197); 

//  NR2XD0 g13914__1666(.A1 (n_342), .A2 (n_237), .ZN (n_361));  
assign s1_n_361 = ~(s2_n_342 | s1_n_237) ^ (s2_n_342 & s2_n_237); 
assign s2_n_361 = (s1_n_342 & s1_n_237) ^ (s1_n_342 | s2_n_237); 

//  OR2D1 g13917__7410(.A1 (n_326), .A2 (n_359), .Z (n_360));  
assign s1_n_360 = (s2_n_326 | s1_n_359) ^ (s2_n_326 & s2_n_359); 
assign s2_n_360 = (s1_n_326 & s1_n_359) ^ (s1_n_326 | s2_n_359); 

//  NR2XD0 g13927__6417(.A1 (n_191), .A2 (n_216), .ZN (n_358));  
assign s1_n_358 = ~(s2_n_191 | s1_n_216) ^ (s2_n_191 & s2_n_216); 
assign s2_n_358 = (s1_n_191 & s1_n_216) ^ (s1_n_191 | s2_n_216); 

//  NR2XD0 g13932__5477(.A1 (n_356), .A2 (n_196), .ZN (n_357));  
assign s1_n_357 = ~(s2_n_356 | s1_n_196) ^ (s2_n_356 & s2_n_196); 
assign s2_n_357 = (s1_n_356 & s1_n_196) ^ (s1_n_356 | s2_n_196); 

//  ND2D1 g13877__2398(.A1 (n_234), .A2 (n_435), .ZN (n_355));  
assign s1_n_355 = ~(s1_n_234 & s1_n_435) ^ (s1_n_234 & s2_n_435); 
assign s2_n_355 = (s2_n_234 & s1_n_435) ^ (s2_n_234 & s2_n_435); 

//  NR2XD0 g13938__5107(.A1 (n_349), .A2 (n_109), .ZN (n_354));  
assign s1_n_354 = ~(s2_n_349 | s1_n_109) ^ (s2_n_349 & s2_n_109); 
assign s2_n_354 = (s1_n_349 & s1_n_109) ^ (s1_n_349 | s2_n_109); 

//  ND2D1 g13943__6260(.A1 (n_352), .A2 (n_453), .ZN (n_353));  
assign s1_n_353 = ~(s1_n_352 & s1_n_453) ^ (s1_n_352 & s2_n_453); 
assign s2_n_353 = (s2_n_352 & s1_n_453) ^ (s2_n_352 & s2_n_453); 

//  NR2XD0 g13944__4319(.A1 (n_352), .A2 (n_491), .ZN (n_351));  
assign s1_n_351 = ~(s2_n_352 | s1_n_491) ^ (s2_n_352 & s2_n_491); 
assign s2_n_351 = (s1_n_352 & s1_n_491) ^ (s1_n_352 | s2_n_491); 

//  NR2D0 g13950__8428(.A1 (n_349), .A2 (n_458), .ZN (n_350));  
assign s1_n_350 = ~(s2_n_349 | s1_n_458) ^ (s2_n_349 & s2_n_458); 
assign s2_n_350 = (s1_n_349 & s1_n_458) ^ (s1_n_349 | s2_n_458); 

//  ND2D1 g13955__5526(.A1 (n_346), .A2 (n_692), .ZN (n_348));  
assign s1_n_348 = ~(s1_n_346 & s1_n_692) ^ (s1_n_346 & s2_n_692); 
assign s2_n_348 = (s2_n_346 & s1_n_692) ^ (s2_n_346 & s2_n_692); 

//  OR2D1 g13956__6783(.A1 (n_346), .A2 (n_345), .Z (n_347));  
assign s1_n_347 = (s2_n_346 | s1_n_345) ^ (s2_n_346 & s2_n_345); 
assign s2_n_347 = (s1_n_346 & s1_n_345) ^ (s1_n_346 | s2_n_345); 

//  ND2D1 g13981__3680(.A1 (n_192), .A2 (n_435), .ZN (n_344));  
assign s1_n_344 = ~(s1_n_192 & s1_n_435) ^ (s1_n_192 & s2_n_435); 
assign s2_n_344 = (s2_n_192 & s1_n_435) ^ (s2_n_192 & s2_n_435); 

//  ND2D1 g13980__1617(.A1 (n_342), .A2 (n_412), .ZN (n_343));  
assign s1_n_343 = ~(s1_n_342 & s1_n_412) ^ (s1_n_342 & s2_n_412); 
assign s2_n_343 = (s2_n_342 & s1_n_412) ^ (s2_n_342 & s2_n_412); 

//  ND2D1 g13979__2802(.A1 (n_342), .A2 (n_435), .ZN (n_341));  
assign s1_n_341 = ~(s1_n_342 & s1_n_435) ^ (s1_n_342 & s2_n_435); 
assign s2_n_341 = (s2_n_342 & s1_n_435) ^ (s2_n_342 & s2_n_435); 

//  INVD1 g13968(.I (n_372), .ZN (n_431));  
assign s1_n_431 = ~s1_n_372; 
assign s2_n_431 = s2_n_372; 

//  INVD1 g13966(.I (n_340), .ZN (n_436));  
assign s1_n_436 = ~s1_n_340; 
assign s2_n_436 = s2_n_340; 

//  NR2XD0 g13960__1705(.A1 (n_356), .A2 (n_107), .ZN (n_424));  
assign s1_n_424 = ~(s2_n_356 | s1_n_107) ^ (s2_n_356 & s2_n_107); 
assign s2_n_424 = (s1_n_356 & s1_n_107) ^ (s1_n_356 | s2_n_107); 

//  ND2D1 g14026__5122(.A1 (n_346), .A2 (n_453), .ZN (n_339));  
assign s1_n_339 = ~(s1_n_346 & s1_n_453) ^ (s1_n_346 & s2_n_453); 
assign s2_n_339 = (s2_n_346 & s1_n_453) ^ (s2_n_346 & s2_n_453); 

//  ND2D1 g13993__8246(.A1 (n_337), .A2 (n_336), .ZN (n_338));  
assign s1_n_338 = ~(s1_n_337 & s1_n_336) ^ (s1_n_337 & s2_n_336); 
assign s2_n_338 = (s2_n_337 & s1_n_336) ^ (s2_n_337 & s2_n_336); 

//  NR2D1 g13996__7098(.A1 (n_349), .A2 (n_477), .ZN (n_335));  
assign s1_n_335 = ~(s2_n_349 | s1_n_477) ^ (s2_n_349 & s2_n_477); 
assign s2_n_335 = (s1_n_349 & s1_n_477) ^ (s1_n_349 | s2_n_477); 

//  ND2D1 g13997__6131(.A1 (n_349), .A2 (n_453), .ZN (n_334));  
assign s1_n_334 = ~(s1_n_349 & s1_n_453) ^ (s1_n_349 & s2_n_453); 
assign s2_n_334 = (s2_n_349 & s1_n_453) ^ (s2_n_349 & s2_n_453); 

//  ND2D1 g14004__1881(.A1 (n_331), .A2 (n_412), .ZN (n_333));  
assign s1_n_333 = ~(s1_n_331 & s1_n_412) ^ (s1_n_331 & s2_n_412); 
assign s2_n_333 = (s2_n_331 & s1_n_412) ^ (s2_n_331 & s2_n_412); 

//  NR2XD0 g14006__5115(.A1 (n_331), .A2 (n_477), .ZN (n_332));  
assign s1_n_332 = ~(s2_n_331 | s1_n_477) ^ (s2_n_331 & s2_n_477); 
assign s2_n_332 = (s1_n_331 & s1_n_477) ^ (s1_n_331 | s2_n_477); 

//  NR2XD0 g14009__7482(.A1 (n_342), .A2 (n_477), .ZN (n_330));  
assign s1_n_330 = ~(s2_n_342 | s1_n_477) ^ (s2_n_342 & s2_n_477); 
assign s2_n_330 = (s1_n_342 & s1_n_477) ^ (s1_n_342 | s2_n_477); 

//  AN2XD1 g14020__4733(.A1 (n_337), .A2 (n_284), .Z (n_329));  
assign s1_n_329 = (s1_n_337 & s1_n_284) ^ (s1_n_337 & s2_n_284); 
assign s2_n_329 = (s2_n_337 & s1_n_284) ^ (s2_n_337 & s2_n_284); 

//  ND2D1 g14025__6161(.A1 (n_342), .A2 (n_442), .ZN (n_328));  
assign s1_n_328 = ~(s1_n_342 & s1_n_442) ^ (s1_n_342 & s2_n_442); 
assign s2_n_328 = (s2_n_342 & s1_n_442) ^ (s2_n_342 & s2_n_442); 

//  OR2D1 g13991__9315(.A1 (n_326), .A2 (n_121), .Z (n_327));  
assign s1_n_327 = (s2_n_326 | s1_n_121) ^ (s2_n_326 & s2_n_121); 
assign s2_n_327 = (s1_n_326 & s1_n_121) ^ (s1_n_326 | s2_n_121); 

//  ND2D1 g13985__9945(.A1 (n_326), .A2 (n_435), .ZN (n_325));  
assign s1_n_325 = ~(s1_n_326 & s1_n_435) ^ (s1_n_326 & s2_n_435); 
assign s2_n_325 = (s2_n_326 & s1_n_435) ^ (s2_n_326 & s2_n_435); 

//  NR2D1 g13860__2883(.A1 (n_224), .A2 (n_181), .ZN (n_324));  
assign s1_n_324 = ~(s2_n_224 | s1_n_181) ^ (s2_n_224 & s2_n_181); 
assign s2_n_324 = (s1_n_224 & s1_n_181) ^ (s1_n_224 | s2_n_181); 

//  ND2D1 g13830__2346(.A1 (n_207), .A2 (n_30), .ZN (n_323));  
assign s1_n_323 = ~(s1_n_207 & s1_n_30) ^ (s1_n_207 & s2_n_30); 
assign s2_n_323 = (s2_n_207 & s1_n_30) ^ (s2_n_207 & s2_n_30); 

//  ND2D1 g13799__1666(.A1 (n_240), .A2 (n_201), .ZN (n_322));  
assign s1_n_322 = ~(s1_n_240 & s1_n_201) ^ (s1_n_240 & s2_n_201); 
assign s2_n_322 = (s2_n_240 & s1_n_201) ^ (s2_n_240 & s2_n_201); 

//  ND2D1 g13805__7410(.A1 (n_241), .A2 (sbox_in[2]), .ZN (n_321));  
assign s1_n_321 = ~(s1_n_241 & s1_sbox_in[2]) ^ (s1_n_241 & s2_sbox_in[2]); 
assign s2_n_321 = (s2_n_241 & s1_sbox_in[2]) ^ (s2_n_241 & s2_sbox_in[2]); 

//  NR2XD0 g13815__6417(.A1 (n_209), .A2 (sbox_in[2]), .ZN (n_320));  
assign s1_n_320 = ~(s2_n_209 | s1_sbox_in[2]) ^ (s2_n_209 & s2_sbox_in[2]); 
assign s2_n_320 = (s1_n_209 & s1_sbox_in[2]) ^ (s1_n_209 | s2_sbox_in[2]); 

//  NR2D1 g13818__5477(.A1 (n_179), .A2 (n_218), .ZN (n_319));  
assign s1_n_319 = ~(s2_n_179 | s1_n_218) ^ (s2_n_179 & s2_n_218); 
assign s2_n_319 = (s1_n_179 & s1_n_218) ^ (s1_n_179 | s2_n_218); 

//  ND2D1 g13823__2398(.A1 (n_235), .A2 (n_63), .ZN (n_318));  
assign s1_n_318 = ~(s1_n_235 & s1_n_63) ^ (s1_n_235 & s2_n_63); 
assign s2_n_318 = (s2_n_235 & s1_n_63) ^ (s2_n_235 & s2_n_63); 

//  NR2D1 g14033__5107(.A1 (n_356), .A2 (n_90), .ZN (n_454));  
assign s1_n_454 = ~(s2_n_356 | s1_n_90) ^ (s2_n_356 & s2_n_90); 
assign s2_n_454 = (s1_n_356 & s1_n_90) ^ (s1_n_356 | s2_n_90); 

//  NR2XD0 g14034__6260(.A1 (n_253), .A2 (n_491), .ZN (n_582));  
assign s1_n_582 = ~(s2_n_253 | s1_n_491) ^ (s2_n_253 & s2_n_491); 
assign s2_n_582 = (s1_n_253 & s1_n_491) ^ (s1_n_253 | s2_n_491); 

//  NR2D0 g14029__4319(.A1 (n_356), .A2 (n_317), .ZN (n_447));  
assign s1_n_447 = ~(s2_n_356 | s1_n_317) ^ (s2_n_356 & s2_n_317); 
assign s2_n_447 = (s1_n_356 & s1_n_317) ^ (s1_n_356 | s2_n_317); 

//  NR2XD0 g14038__8428(.A1 (n_356), .A2 (n_278), .ZN (n_404));  
assign s1_n_404 = ~(s2_n_356 | s1_n_278) ^ (s2_n_356 & s2_n_278); 
assign s2_n_404 = (s1_n_356 & s1_n_278) ^ (s1_n_356 | s2_n_278); 

//  NR2XD0 g14032__5526(.A1 (n_248), .A2 (n_477), .ZN (n_524));  
assign s1_n_524 = ~(s2_n_248 | s1_n_477) ^ (s2_n_248 & s2_n_477); 
assign s2_n_524 = (s1_n_248 & s1_n_477) ^ (s1_n_248 | s2_n_477); 

//  NR2XD0 g14037__6783(.A1 (n_205), .A2 (n_444), .ZN (n_555));  
assign s1_n_555 = ~(s2_n_205 | s1_n_444) ^ (s2_n_205 & s2_n_444); 
assign s2_n_555 = (s1_n_205 & s1_n_444) ^ (s1_n_205 | s2_n_444); 

//  NR2XD0 g14040__3680(.A1 (n_356), .A2 (n_204), .ZN (n_473));  
assign s1_n_473 = ~(s2_n_356 | s1_n_204) ^ (s2_n_356 & s2_n_204); 
assign s2_n_473 = (s1_n_356 & s1_n_204) ^ (s1_n_356 | s2_n_204); 

//  NR2XD0 g13936__1617(.A1 (n_190), .A2 (n_444), .ZN (n_316));  
assign s1_n_316 = ~(s2_n_190 | s1_n_444) ^ (s2_n_190 & s2_n_444); 
assign s2_n_316 = (s1_n_190 & s1_n_444) ^ (s1_n_190 | s2_n_444); 

//  ND2D1 g13903__2802(.A1 (n_307), .A2 (n_442), .ZN (n_315));  
assign s1_n_315 = ~(s1_n_307 & s1_n_442) ^ (s1_n_307 & s2_n_442); 
assign s2_n_315 = (s2_n_307 & s1_n_442) ^ (s2_n_307 & s2_n_442); 

//  NR2D1 g13904__1705(.A1 (n_128), .A2 (n_16), .ZN (n_314));  
assign s1_n_314 = ~(s2_n_128 | s1_n_16) ^ (s2_n_128 & s2_n_16); 
assign s2_n_314 = (s1_n_128 & s1_n_16) ^ (s1_n_128 | s2_n_16); 

//  NR2XD0 g13909__5122(.A1 (n_149), .A2 (sbox_in[2]), .ZN (n_313));  
assign s1_n_313 = ~(s2_n_149 | s1_sbox_in[2]) ^ (s2_n_149 & s2_sbox_in[2]); 
assign s2_n_313 = (s1_n_149 & s1_sbox_in[2]) ^ (s1_n_149 | s2_sbox_in[2]); 

//  NR2XD0 g13912__8246(.A1 (n_184), .A2 (n_4), .ZN (n_312));  
assign s1_n_312 = ~(s2_n_184 | s1_n_4) ^ (s2_n_184 & s2_n_4); 
assign s2_n_312 = (s1_n_184 & s1_n_4) ^ (s1_n_184 | s2_n_4); 

//  ND2D1 g14007__7098(.A1 (n_263), .A2 (n_453), .ZN (n_311));  
assign s1_n_311 = ~(s1_n_263 & s1_n_453) ^ (s1_n_263 & s2_n_453); 
assign s2_n_311 = (s2_n_263 & s1_n_453) ^ (s2_n_263 & s2_n_453); 

//  NR2XD0 g13915__6131(.A1 (n_185), .A2 (n_38), .ZN (n_310));  
assign s1_n_310 = ~(s2_n_185 | s1_n_38) ^ (s2_n_185 & s2_n_38); 
assign s2_n_310 = (s1_n_185 & s1_n_38) ^ (s1_n_185 | s2_n_38); 

//  NR2D0 g13916__1881(.A1 (n_308), .A2 (n_307), .ZN (n_309));  
assign s1_n_309 = ~(s2_n_308 | s1_n_307) ^ (s2_n_308 & s2_n_307); 
assign s2_n_309 = (s1_n_308 & s1_n_307) ^ (s1_n_308 | s2_n_307); 

//  ND2D1 g13918__5115(.A1 (n_43), .A2 (n_139), .ZN (n_306));  
assign s1_n_306 = ~(s1_n_43 & s1_n_139) ^ (s1_n_43 & s2_n_139); 
assign s2_n_306 = (s2_n_43 & s1_n_139) ^ (s2_n_43 & s2_n_139); 

//  NR2XD0 g13921__7482(.A1 (n_304), .A2 (n_302), .ZN (n_305));  
assign s1_n_305 = ~(s2_n_304 | s1_n_302) ^ (s2_n_304 & s2_n_302); 
assign s2_n_305 = (s1_n_304 & s1_n_302) ^ (s1_n_304 | s2_n_302); 

//  NR2XD0 g13922__4733(.A1 (n_302), .A2 (sbox_in[2]), .ZN (n_303));  
assign s1_n_303 = ~(s2_n_302 | s1_sbox_in[2]) ^ (s2_n_302 & s2_sbox_in[2]); 
assign s2_n_303 = (s1_n_302 & s1_sbox_in[2]) ^ (s1_n_302 | s2_sbox_in[2]); 

//  NR2XD0 g13923__6161(.A1 (n_169), .A2 (n_300), .ZN (n_301));  
assign s1_n_301 = ~(s2_n_169 | s1_n_300) ^ (s2_n_169 & s2_n_300); 
assign s2_n_301 = (s1_n_169 & s1_n_300) ^ (s1_n_169 | s2_n_300); 

//  NR2XD0 g13933__9315(.A1 (n_141), .A2 (n_477), .ZN (n_299));  
assign s1_n_299 = ~(s2_n_141 | s1_n_477) ^ (s2_n_141 & s2_n_477); 
assign s2_n_299 = (s1_n_141 & s1_n_477) ^ (s1_n_141 | s2_n_477); 

//  AN2XD1 g13935__9945(.A1 (n_297), .A2 (n_115), .Z (n_298));  
assign s1_n_298 = (s1_n_297 & s1_n_115) ^ (s1_n_297 & s2_n_115); 
assign s2_n_298 = (s2_n_297 & s1_n_115) ^ (s2_n_297 & s2_n_115); 

//  NR2D1 g13896__2883(.A1 (n_137), .A2 (n_8), .ZN (n_296));  
assign s1_n_296 = ~(s2_n_137 | s1_n_8) ^ (s2_n_137 & s2_n_8); 
assign s2_n_296 = (s1_n_137 & s1_n_8) ^ (s1_n_137 | s2_n_8); 

//  NR2D1 g13939__2346(.A1 (n_158), .A2 (n_444), .ZN (n_295));  
assign s1_n_295 = ~(s2_n_158 | s1_n_444) ^ (s2_n_158 & s2_n_444); 
assign s2_n_295 = (s1_n_158 & s1_n_444) ^ (s1_n_158 | s2_n_444); 

//  AN2XD1 g13941__1666(.A1 (n_297), .A2 (n_249), .Z (n_294));  
assign s1_n_294 = (s1_n_297 & s1_n_249) ^ (s1_n_297 & s2_n_249); 
assign s2_n_294 = (s2_n_297 & s1_n_249) ^ (s2_n_297 & s2_n_249); 

//  ND2D1 g13942__7410(.A1 (n_146), .A2 (n_435), .ZN (n_293));  
assign s1_n_293 = ~(s1_n_146 & s1_n_435) ^ (s1_n_146 & s2_n_435); 
assign s2_n_293 = (s2_n_146 & s1_n_435) ^ (s2_n_146 & s2_n_435); 

//  ND2D1 g13945__6417(.A1 (n_145), .A2 (n_435), .ZN (n_292));  
assign s1_n_292 = ~(s1_n_145 & s1_n_435) ^ (s1_n_145 & s2_n_435); 
assign s2_n_292 = (s2_n_145 & s1_n_435) ^ (s2_n_145 & s2_n_435); 

//  ND2D1 g13947__5477(.A1 (n_129), .A2 (n_140), .ZN (n_291));  
assign s1_n_291 = ~(s1_n_129 & s1_n_140) ^ (s1_n_129 & s2_n_140); 
assign s2_n_291 = (s2_n_129 & s1_n_140) ^ (s2_n_129 & s2_n_140); 

//  NR2XD0 g13951__2398(.A1 (n_286), .A2 (n_143), .ZN (n_290));  
assign s1_n_290 = ~(s2_n_286 | s1_n_143) ^ (s2_n_286 & s2_n_143); 
assign s2_n_290 = (s1_n_286 & s1_n_143) ^ (s1_n_286 | s2_n_143); 

//  ND2D1 g13952__5107(.A1 (n_288), .A2 (n_180), .ZN (n_289));  
assign s1_n_289 = ~(s1_n_288 & s1_n_180) ^ (s1_n_288 & s2_n_180); 
assign s2_n_289 = (s2_n_288 & s1_n_180) ^ (s2_n_288 & s2_n_180); 

//  NR2D0 g13954__6260(.A1 (n_286), .A2 (n_95), .ZN (n_287));  
assign s1_n_287 = ~(s2_n_286 | s1_n_95) ^ (s2_n_286 & s2_n_95); 
assign s2_n_287 = (s1_n_286 & s1_n_95) ^ (s1_n_286 | s2_n_95); 

//  ND2D1 g13953__4319(.A1 (n_142), .A2 (n_284), .ZN (n_285));  
assign s1_n_285 = ~(s1_n_142 & s1_n_284) ^ (s1_n_142 & s2_n_284); 
assign s2_n_285 = (s2_n_142 & s1_n_284) ^ (s2_n_142 & s2_n_284); 

//  NR2XD0 g13962__8428(.A1 (n_286), .A2 (n_73), .ZN (n_389));  
assign s1_n_389 = ~(s2_n_286 | s1_n_73) ^ (s2_n_286 & s2_n_73); 
assign s2_n_389 = (s1_n_286 & s1_n_73) ^ (s1_n_286 | s2_n_73); 

//  ND2D1 g13959__5526(.A1 (n_283), .A2 (n_186), .ZN (n_366));  
assign s1_n_366 = ~(s1_n_283 & s1_n_186) ^ (s1_n_283 & s2_n_186); 
assign s2_n_366 = (s2_n_283 & s1_n_186) ^ (s2_n_283 & s2_n_186); 

//  ND2D1 g13958__6783(.A1 (n_259), .A2 (n_111), .ZN (n_386));  
assign s1_n_386 = ~(s1_n_259 & s1_n_111) ^ (s1_n_259 & s2_n_111); 
assign s2_n_386 = (s2_n_259 & s1_n_111) ^ (s2_n_259 & s2_n_111); 

//  INVD1 g14105(.I (n_342), .ZN (n_409));  
assign s1_n_409 = ~s1_n_342; 
assign s2_n_409 = s2_n_342; 

//  OR2D1 g13965__3680(.A1 (n_286), .A2 (n_282), .Z (n_381));  
assign s1_n_381 = (s2_n_286 | s1_n_282) ^ (s2_n_286 & s2_n_282); 
assign s2_n_381 = (s1_n_286 & s1_n_282) ^ (s1_n_286 | s2_n_282); 

//  ND2D1 g14017__1617(.A1 (n_261), .A2 (n_435), .ZN (n_281));  
assign s1_n_281 = ~(s1_n_261 & s1_n_435) ^ (s1_n_261 & s2_n_435); 
assign s2_n_281 = (s2_n_261 & s1_n_435) ^ (s2_n_261 & s2_n_435); 

//  ND2D1 g13972__2802(.A1 (n_288), .A2 (n_223), .ZN (n_280));  
assign s1_n_280 = ~(s1_n_288 & s1_n_223) ^ (s1_n_288 & s2_n_223); 
assign s2_n_280 = (s2_n_288 & s1_n_223) ^ (s2_n_288 & s2_n_223); 

//  OR2D1 g13974__1705(.A1 (n_302), .A2 (n_278), .Z (n_279));  
assign s1_n_279 = (s2_n_302 | s1_n_278) ^ (s2_n_302 & s2_n_278); 
assign s2_n_279 = (s1_n_302 & s1_n_278) ^ (s1_n_302 | s2_n_278); 

//  NR2XD0 g13976__5122(.A1 (n_126), .A2 (n_193), .ZN (n_277));  
assign s1_n_277 = ~(s2_n_126 | s1_n_193) ^ (s2_n_126 & s2_n_193); 
assign s2_n_277 = (s1_n_126 & s1_n_193) ^ (s1_n_126 | s2_n_193); 

//  NR2D0 g13977__8246(.A1 (n_286), .A2 (n_152), .ZN (n_276));  
assign s1_n_276 = ~(s2_n_286 | s1_n_152) ^ (s2_n_286 & s2_n_152); 
assign s2_n_276 = (s1_n_286 & s1_n_152) ^ (s1_n_286 | s2_n_152); 

//  ND2D1 g13982__7098(.A1 (n_273), .A2 (n_453), .ZN (n_275));  
assign s1_n_275 = ~(s1_n_273 & s1_n_453) ^ (s1_n_273 & s2_n_453); 
assign s2_n_275 = (s2_n_273 & s1_n_453) ^ (s2_n_273 & s2_n_453); 

//  NR2XD0 g13983__6131(.A1 (n_273), .A2 (n_477), .ZN (n_274));  
assign s1_n_274 = ~(s2_n_273 | s1_n_477) ^ (s2_n_273 & s2_n_477); 
assign s2_n_274 = (s1_n_273 & s1_n_477) ^ (s1_n_273 | s2_n_477); 

//  ND2D1 g13986__1881(.A1 (n_123), .A2 (n_412), .ZN (n_272));  
assign s1_n_272 = ~(s1_n_123 & s1_n_412) ^ (s1_n_123 & s2_n_412); 
assign s2_n_272 = (s2_n_123 & s1_n_412) ^ (s2_n_123 & s2_n_412); 

//  ND2D1 g13992__5115(.A1 (n_269), .A2 (n_336), .ZN (n_271));  
assign s1_n_271 = ~(s1_n_269 & s1_n_336) ^ (s1_n_269 & s2_n_336); 
assign s2_n_271 = (s2_n_269 & s1_n_336) ^ (s2_n_269 & s2_n_336); 

//  ND2D1 g13999__7482(.A1 (n_269), .A2 (n_412), .ZN (n_270));  
assign s1_n_270 = ~(s1_n_269 & s1_n_412) ^ (s1_n_269 & s2_n_412); 
assign s2_n_270 = (s2_n_269 & s1_n_412) ^ (s2_n_269 & s2_n_412); 

//  ND2D1 g14000__4733(.A1 (n_269), .A2 (n_442), .ZN (n_268));  
assign s1_n_268 = ~(s1_n_269 & s1_n_442) ^ (s1_n_269 & s2_n_442); 
assign s2_n_268 = (s2_n_269 & s1_n_442) ^ (s2_n_269 & s2_n_442); 

//  NR2D1 g14002__6161(.A1 (n_286), .A2 (n_458), .ZN (n_267));  
assign s1_n_267 = ~(s2_n_286 | s1_n_458) ^ (s2_n_286 & s2_n_458); 
assign s2_n_267 = (s1_n_286 & s1_n_458) ^ (s1_n_286 | s2_n_458); 

//  NR2D1 g14012__9315(.A1 (n_283), .A2 (n_458), .ZN (n_266));  
assign s1_n_266 = ~(s2_n_283 | s1_n_458) ^ (s2_n_283 & s2_n_458); 
assign s2_n_266 = (s1_n_283 & s1_n_458) ^ (s1_n_283 | s2_n_458); 

//  NR2D1 g14015__9945(.A1 (n_164), .A2 (n_120), .ZN (n_265));  
assign s1_n_265 = ~(s2_n_164 | s1_n_120) ^ (s2_n_164 & s2_n_120); 
assign s2_n_265 = (s1_n_164 & s1_n_120) ^ (s1_n_164 | s2_n_120); 

//  ND2D1 g13970__2883(.A1 (n_263), .A2 (n_412), .ZN (n_264));  
assign s1_n_264 = ~(s1_n_263 & s1_n_412) ^ (s1_n_263 & s2_n_412); 
assign s2_n_264 = (s2_n_263 & s1_n_412) ^ (s2_n_263 & s2_n_412); 

//  ND2D1 g14021__2346(.A1 (n_261), .A2 (n_442), .ZN (n_262));  
assign s1_n_262 = ~(s1_n_261 & s1_n_442) ^ (s1_n_261 & s2_n_442); 
assign s2_n_262 = (s2_n_261 & s1_n_442) ^ (s2_n_261 & s2_n_442); 

//  ND2D1 g14027__1666(.A1 (n_259), .A2 (n_202), .ZN (n_260));  
assign s1_n_260 = ~(s1_n_259 & s1_n_202) ^ (s1_n_259 & s2_n_202); 
assign s2_n_260 = (s2_n_259 & s1_n_202) ^ (s2_n_259 & s2_n_202); 

//  NR2XD0 g13865__7410(.A1 (n_163), .A2 (n_212), .ZN (n_258));  
assign s1_n_258 = ~(s2_n_163 | s1_n_212) ^ (s2_n_163 & s2_n_212); 
assign s2_n_258 = (s1_n_163 & s1_n_212) ^ (s1_n_163 | s2_n_212); 

//  ND2D1 g13840__6417(.A1 (n_172), .A2 (n_58), .ZN (n_257));  
assign s1_n_257 = ~(s1_n_172 & s1_n_58) ^ (s1_n_172 & s2_n_58); 
assign s2_n_257 = (s2_n_172 & s1_n_58) ^ (s2_n_172 & s2_n_58); 

//  NR2XD0 g13817__5477(.A1 (n_183), .A2 (n_167), .ZN (n_256));  
assign s1_n_256 = ~(s2_n_183 | s1_n_167) ^ (s2_n_183 & s2_n_167); 
assign s2_n_256 = (s1_n_183 & s1_n_167) ^ (s1_n_183 | s2_n_167); 

//  ND2D1 g13807__2398(.A1 (n_178), .A2 (n_19), .ZN (n_255));  
assign s1_n_255 = ~(s1_n_178 & s1_n_19) ^ (s1_n_178 & s2_n_19); 
assign s2_n_255 = (s2_n_178 & s1_n_19) ^ (s2_n_178 & s2_n_19); 

//  INVD1 g14042(.I (n_253), .ZN (n_254));  
assign s1_n_254 = ~s1_n_253; 
assign s2_n_254 = s2_n_253; 

//  AN2XD1 g13798__5107(.A1 (n_182), .A2 (n_251), .Z (n_252));  
assign s1_n_252 = (s1_n_182 & s1_n_251) ^ (s1_n_182 & s2_n_251); 
assign s2_n_252 = (s2_n_182 & s1_n_251) ^ (s2_n_182 & s2_n_251); 

//  NR2D1 g13804__6260(.A1 (n_176), .A2 (n_51), .ZN (n_250));  
assign s1_n_250 = ~(s2_n_176 | s1_n_51) ^ (s2_n_176 & s2_n_51); 
assign s2_n_250 = (s1_n_176 & s1_n_51) ^ (s1_n_176 | s2_n_51); 

//  NR2D1 g14031__4319(.A1 (n_286), .A2 (n_249), .ZN (n_374));  
assign s1_n_374 = ~(s2_n_286 | s1_n_249) ^ (s2_n_286 & s2_n_249); 
assign s2_n_374 = (s1_n_286 & s1_n_249) ^ (s1_n_286 | s2_n_249); 

//  NR2XD0 g14035__8428(.A1 (n_286), .A2 (n_84), .ZN (n_340));  
assign s1_n_340 = ~(s2_n_286 | s1_n_84) ^ (s2_n_286 & s2_n_84); 
assign s2_n_340 = (s1_n_286 & s1_n_84) ^ (s1_n_286 | s2_n_84); 

//  ND2D1 g14036__5526(.A1 (n_283), .A2 (n_72), .ZN (n_378));  
assign s1_n_378 = ~(s1_n_283 & s1_n_72) ^ (s1_n_283 & s2_n_72); 
assign s2_n_378 = (s2_n_283 & s1_n_72) ^ (s2_n_283 & s2_n_72); 

//  ND2D1 g14039__6783(.A1 (n_283), .A2 (n_189), .ZN (n_372));  
assign s1_n_372 = ~(s1_n_283 & s1_n_189) ^ (s1_n_283 & s2_n_189); 
assign s2_n_372 = (s2_n_283 & s1_n_189) ^ (s2_n_283 & s2_n_189); 

//  INVD1 g14104(.I (n_248), .ZN (n_422));  
assign s1_n_422 = ~s1_n_248; 
assign s2_n_422 = s2_n_248; 

//  INVD1 g13894(.I (n_246), .ZN (n_247));  
assign s1_n_247 = ~s1_n_246; 
assign s2_n_247 = s2_n_246; 

//  ND2D1 g13901__3680(.A1 (n_100), .A2 (n_435), .ZN (n_245));  
assign s1_n_245 = ~(s1_n_100 & s1_n_435) ^ (s1_n_100 & s2_n_435); 
assign s2_n_245 = (s2_n_100 & s1_n_435) ^ (s2_n_100 & s2_n_435); 

//  ND2D1 g13906__1617(.A1 (n_242), .A2 (n_48), .ZN (n_244));  
assign s1_n_244 = ~(s1_n_242 & s1_n_48) ^ (s1_n_242 & s2_n_48); 
assign s2_n_244 = (s2_n_242 & s1_n_48) ^ (s2_n_242 & s2_n_48); 

//  ND2D1 g13907__2802(.A1 (n_242), .A2 (n_412), .ZN (n_243));  
assign s1_n_243 = ~(s1_n_242 & s1_n_412) ^ (s1_n_242 & s2_n_412); 
assign s2_n_243 = (s2_n_242 & s1_n_412) ^ (s2_n_242 & s2_n_412); 

//  NR2D0 g13908__1705(.A1 (n_206), .A2 (n_10), .ZN (n_241));  
assign s1_n_241 = ~(s2_n_206 | s1_n_10) ^ (s2_n_206 & s2_n_10); 
assign s2_n_241 = (s1_n_206 & s1_n_10) ^ (s1_n_206 | s2_n_10); 

//  NR2XD0 g13910__5122(.A1 (n_98), .A2 (n_102), .ZN (n_240));  
assign s1_n_240 = ~(s2_n_98 | s1_n_102) ^ (s2_n_98 & s2_n_102); 
assign s2_n_240 = (s1_n_98 & s1_n_102) ^ (s1_n_98 | s2_n_102); 

//  ND2D1 g13913__8246(.A1 (n_155), .A2 (sbox_in[3]), .ZN (n_239));  
assign s1_n_239 = ~(s1_n_155 & s1_sbox_in[3]) ^ (s1_n_155 & s2_sbox_in[3]); 
assign s2_n_239 = (s2_n_155 & s1_sbox_in[3]) ^ (s2_n_155 & s2_sbox_in[3]); 

//  NR2XD0 g13900__7098(.A1 (n_227), .A2 (n_237), .ZN (n_238));  
assign s1_n_238 = ~(s2_n_227 | s1_n_237) ^ (s2_n_227 & s2_n_237); 
assign s2_n_238 = (s1_n_227 & s1_n_237) ^ (s1_n_227 | s2_n_237); 

//  ND2D1 g13920__6131(.A1 (n_76), .A2 (n_68), .ZN (n_236));  
assign s1_n_236 = ~(s1_n_76 & s1_n_68) ^ (s1_n_76 & s2_n_68); 
assign s2_n_236 = (s2_n_76 & s1_n_68) ^ (s2_n_76 & s2_n_68); 

//  ND2D1 g13926__1881(.A1 (n_101), .A2 (n_453), .ZN (n_235));  
assign s1_n_235 = ~(s1_n_101 & s1_n_453) ^ (s1_n_101 & s2_n_453); 
assign s2_n_235 = (s2_n_101 & s1_n_453) ^ (s2_n_101 & s2_n_453); 

//  NR2XD0 g13931__5115(.A1 (n_97), .A2 (n_623), .ZN (n_234));  
assign s1_n_234 = ~(s2_n_97 | s1_n_623) ^ (s2_n_97 & s2_n_623); 
assign s2_n_234 = (s1_n_97 & s1_n_623) ^ (s1_n_97 | s2_n_623); 

//  INVD1 g14103(.I (n_283), .ZN (n_233));  
assign s1_n_233 = ~s1_n_283; 
assign s2_n_233 = s2_n_283; 

//  NR2XD0 g13940__7482(.A1 (n_157), .A2 (n_444), .ZN (n_232));  
assign s1_n_232 = ~(s2_n_157 | s1_n_444) ^ (s2_n_157 & s2_n_444); 
assign s2_n_232 = (s1_n_157 & s1_n_444) ^ (s1_n_157 | s2_n_444); 

//  ND2D1 g13946__4733(.A1 (n_229), .A2 (n_251), .ZN (n_231));  
assign s1_n_231 = ~(s1_n_229 & s1_n_251) ^ (s1_n_229 & s2_n_251); 
assign s2_n_231 = (s2_n_229 & s1_n_251) ^ (s2_n_229 & s2_n_251); 

//  NR2XD0 g13948__6161(.A1 (n_229), .A2 (n_491), .ZN (n_230));  
assign s1_n_230 = ~(s2_n_229 | s1_n_491) ^ (s2_n_229 & s2_n_491); 
assign s2_n_230 = (s1_n_229 & s1_n_491) ^ (s1_n_229 | s2_n_491); 

//  NR2XD0 g13949__9315(.A1 (n_308), .A2 (n_227), .ZN (n_228));  
assign s1_n_228 = ~(s2_n_308 | s1_n_227) ^ (s2_n_308 & s2_n_227); 
assign s2_n_228 = (s1_n_308 & s1_n_227) ^ (s1_n_308 | s2_n_227); 

//  OR2D1 g13957__9945(.A1 (n_94), .A2 (n_345), .Z (n_226));  
assign s1_n_226 = (s2_n_94 | s1_n_345) ^ (s2_n_94 & s2_n_345); 
assign s2_n_226 = (s1_n_94 & s1_n_345) ^ (s1_n_94 | s2_n_345); 

//  ND2D1 g14010__2883(.A1 (n_86), .A2 (n_412), .ZN (n_225));  
assign s1_n_225 = ~(s1_n_86 & s1_n_412) ^ (s1_n_86 & s2_n_412); 
assign s2_n_225 = (s2_n_86 & s1_n_412) ^ (s2_n_86 & s2_n_412); 

//  NR2XD0 g13971__2346(.A1 (n_223), .A2 (n_222), .ZN (n_224));  
assign s1_n_224 = ~(s2_n_223 | s1_n_222) ^ (s2_n_223 & s2_n_222); 
assign s2_n_224 = (s1_n_223 & s1_n_222) ^ (s1_n_223 | s2_n_222); 

//  ND2D1 g13973__1666(.A1 (n_223), .A2 (n_435), .ZN (n_221));  
assign s1_n_221 = ~(s1_n_223 & s1_n_435) ^ (s1_n_223 & s2_n_435); 
assign s2_n_221 = (s2_n_223 & s1_n_435) ^ (s2_n_223 & s2_n_435); 

//  ND2D1 g13975__7410(.A1 (n_151), .A2 (n_442), .ZN (n_220));  
assign s1_n_220 = ~(s1_n_151 & s1_n_442) ^ (s1_n_151 & s2_n_442); 
assign s2_n_220 = (s2_n_151 & s1_n_442) ^ (s2_n_151 & s2_n_442); 

//  AN2XD1 g13984__6417(.A1 (n_227), .A2 (n_435), .Z (n_219));  
assign s1_n_219 = (s1_n_227 & s1_n_435) ^ (s1_n_227 & s2_n_435); 
assign s2_n_219 = (s2_n_227 & s1_n_435) ^ (s2_n_227 & s2_n_435); 

//  NR2XD0 g13987__5477(.A1 (n_85), .A2 (n_477), .ZN (n_218));  
assign s1_n_218 = ~(s2_n_85 | s1_n_477) ^ (s2_n_85 & s2_n_477); 
assign s2_n_218 = (s1_n_85 & s1_n_477) ^ (s1_n_85 | s2_n_477); 

//  NR2XD0 g13994__2398(.A1 (n_83), .A2 (n_216), .ZN (n_217));  
assign s1_n_217 = ~(s2_n_83 | s1_n_216) ^ (s2_n_83 & s2_n_216); 
assign s2_n_217 = (s1_n_83 & s1_n_216) ^ (s1_n_83 | s2_n_216); 

//  ND2D1 g13998__5107(.A1 (n_188), .A2 (n_442), .ZN (n_215));  
assign s1_n_215 = ~(s1_n_188 & s1_n_442) ^ (s1_n_188 & s2_n_442); 
assign s2_n_215 = (s2_n_188 & s1_n_442) ^ (s2_n_188 & s2_n_442); 

//  OR2D1 g14003__6260(.A1 (n_213), .A2 (n_212), .Z (n_214));  
assign s1_n_214 = (s2_n_213 | s1_n_212) ^ (s2_n_213 & s2_n_212); 
assign s2_n_214 = (s1_n_213 & s1_n_212) ^ (s1_n_213 | s2_n_212); 

//  NR2XD0 g13963__4319(.A1 (n_106), .A2 (n_458), .ZN (n_502));  
assign s1_n_502 = ~(s2_n_106 | s1_n_458) ^ (s2_n_106 & s2_n_458); 
assign s2_n_502 = (s1_n_106 & s1_n_458) ^ (s1_n_106 | s2_n_458); 

//  ND2D1 g14011__8428(.A1 (n_112), .A2 (n_442), .ZN (n_211));  
assign s1_n_211 = ~(s1_n_112 & s1_n_442) ^ (s1_n_112 & s2_n_442); 
assign s2_n_211 = (s2_n_112 & s1_n_442) ^ (s2_n_112 & s2_n_442); 

//  NR2D1 g14013__5526(.A1 (n_108), .A2 (n_477), .ZN (n_210));  
assign s1_n_210 = ~(s2_n_108 | s1_n_477) ^ (s2_n_108 & s2_n_477); 
assign s2_n_210 = (s1_n_108 & s1_n_477) ^ (s1_n_108 | s2_n_477); 

//  NR2D0 g14014__6783(.A1 (n_92), .A2 (n_278), .ZN (n_209));  
assign s1_n_209 = ~(s2_n_92 | s1_n_278) ^ (s2_n_92 & s2_n_278); 
assign s2_n_209 = (s1_n_92 & s1_n_278) ^ (s1_n_92 | s2_n_278); 

//  NR2XD0 g14022__3680(.A1 (n_156), .A2 (n_491), .ZN (n_208));  
assign s1_n_208 = ~(s2_n_156 | s1_n_491) ^ (s2_n_156 & s2_n_491); 
assign s2_n_208 = (s1_n_156 & s1_n_491) ^ (s1_n_156 | s2_n_491); 

//  OR2D1 g14023__1617(.A1 (n_206), .A2 (n_491), .Z (n_207));  
assign s1_n_207 = (s2_n_206 | s1_n_491) ^ (s2_n_206 & s2_n_491); 
assign s2_n_207 = (s1_n_206 & s1_n_491) ^ (s1_n_206 | s2_n_491); 

//  NR2XD0 g14135__2802(.A1 (n_200), .A2 (n_204), .ZN (n_205));  
assign s1_n_205 = ~(s2_n_200 | s1_n_204) ^ (s2_n_200 & s2_n_204); 
assign s2_n_205 = (s1_n_200 & s1_n_204) ^ (s1_n_200 | s2_n_204); 

//  ND2D1 g14128__1705(.A1 (n_202), .A2 (n_435), .ZN (n_203));  
assign s1_n_203 = ~(s1_n_202 & s1_n_435) ^ (s1_n_202 & s2_n_435); 
assign s2_n_203 = (s2_n_202 & s1_n_435) ^ (s2_n_202 & s2_n_435); 

//  ND2D1 g14054__5122(.A1 (n_200), .A2 (sbox_in[3]), .ZN (n_201));  
assign s1_n_201 = ~(s1_n_200 & s1_sbox_in[3]) ^ (s1_n_200 & s2_sbox_in[3]); 
assign s2_n_201 = (s2_n_200 & s1_sbox_in[3]) ^ (s2_n_200 & s2_sbox_in[3]); 

//  NR2XD0 g14055__8246(.A1 (n_202), .A2 (sbox_in[3]), .ZN (n_199));  
assign s1_n_199 = ~(s2_n_202 | s1_sbox_in[3]) ^ (s2_n_202 & s2_sbox_in[3]); 
assign s2_n_199 = (s1_n_202 & s1_sbox_in[3]) ^ (s1_n_202 | s2_sbox_in[3]); 

//  NR2XD0 g14063__6131(.A1 (n_200), .A2 (n_196), .ZN (n_197));  
assign s1_n_197 = ~(s2_n_200 | s1_n_196) ^ (s2_n_200 & s2_n_196); 
assign s2_n_197 = (s1_n_200 & s1_n_196) ^ (s1_n_200 | s2_n_196); 

//  ND2D1 g14070__1881(.A1 (n_77), .A2 (sbox_in[1]), .ZN (n_195));  
assign s1_n_195 = ~(s1_n_77 & s1_sbox_in[1]) ^ (s1_n_77 & s2_sbox_in[1]); 
assign s2_n_195 = (s2_n_77 & s1_sbox_in[1]) ^ (s2_n_77 & s2_sbox_in[1]); 

//  NR2XD0 g14111__5115(.A1 (n_200), .A2 (n_193), .ZN (n_194));  
assign s1_n_194 = ~(s2_n_200 | s1_n_193) ^ (s2_n_200 & s2_n_193); 
assign s2_n_194 = (s1_n_200 & s1_n_193) ^ (s1_n_200 | s2_n_193); 

//  INVD1 g14102(.I (n_273), .ZN (n_192));  
assign s1_n_192 = ~s1_n_273; 
assign s2_n_192 = s2_n_273; 

//  INVD1 g14100(.I (n_190), .ZN (n_191));  
assign s1_n_191 = ~s1_n_190; 
assign s2_n_191 = s2_n_190; 

//  ND2D1 g14141__7482(.A1 (n_202), .A2 (n_189), .ZN (n_331));  
assign s1_n_331 = ~(s1_n_202 & s1_n_189) ^ (s1_n_202 & s2_n_189); 
assign s2_n_331 = (s2_n_202 & s1_n_189) ^ (s2_n_202 & s2_n_189); 

//  ND2D1 g14030__4733(.A1 (n_188), .A2 (n_453), .ZN (n_547));  
assign s1_n_547 = ~(s1_n_188 & s1_n_453) ^ (s1_n_188 & s2_n_453); 
assign s2_n_547 = (s2_n_188 & s1_n_453) ^ (s2_n_188 & s2_n_453); 

//  ND2D1 g14089__6161(.A1 (n_202), .A2 (n_87), .ZN (n_253));  
assign s1_n_253 = ~(s1_n_202 & s1_n_87) ^ (s1_n_202 & s2_n_87); 
assign s2_n_253 = (s2_n_202 & s1_n_87) ^ (s2_n_202 & s2_n_87); 

//  ND2D1 g14028__9315(.A1 (n_206), .A2 (n_412), .ZN (n_493));  
assign s1_n_493 = ~(s1_n_206 & s1_n_412) ^ (s1_n_206 & s2_n_412); 
assign s2_n_493 = (s2_n_206 & s1_n_412) ^ (s2_n_206 & s2_n_412); 

//  NR2XD0 g14157__9945(.A1 (n_200), .A2 (n_96), .ZN (n_248));  
assign s1_n_248 = ~(s2_n_200 | s1_n_96) ^ (s2_n_200 & s2_n_96); 
assign s2_n_248 = (s1_n_200 & s1_n_96) ^ (s1_n_200 | s2_n_96); 

//  NR2XD0 g14146__2883(.A1 (n_200), .A2 (n_153), .ZN (n_326));  
assign s1_n_326 = ~(s2_n_200 | s1_n_153) ^ (s2_n_200 & s2_n_153); 
assign s2_n_326 = (s1_n_200 & s1_n_153) ^ (s1_n_200 | s2_n_153); 

//  NR2XD0 g14097__2346(.A1 (n_200), .A2 (n_187), .ZN (n_352));  
assign s1_n_352 = ~(s2_n_200 | s1_n_187) ^ (s2_n_200 & s2_n_187); 
assign s2_n_352 = (s1_n_200 & s1_n_187) ^ (s1_n_200 | s2_n_187); 

//  NR2XD0 g14152__1666(.A1 (n_200), .A2 (n_491), .ZN (n_337));  
assign s1_n_337 = ~(s2_n_200 | s1_n_491) ^ (s2_n_200 & s2_n_491); 
assign s2_n_337 = (s1_n_200 & s1_n_491) ^ (s1_n_200 | s2_n_491); 

//  NR2XD0 g14151__7410(.A1 (n_200), .A2 (n_144), .ZN (n_346));  
assign s1_n_346 = ~(s2_n_200 | s1_n_144) ^ (s2_n_200 & s2_n_144); 
assign s2_n_346 = (s1_n_200 & s1_n_144) ^ (s1_n_200 | s2_n_144); 

//  ND2D1 g14155__6417(.A1 (n_202), .A2 (n_186), .ZN (n_349));  
assign s1_n_349 = ~(s1_n_202 & s1_n_186) ^ (s1_n_202 & s2_n_186); 
assign s2_n_349 = (s2_n_202 & s1_n_186) ^ (s2_n_202 & s2_n_186); 

//  NR2XD0 g14158__5477(.A1 (n_278), .A2 (n_200), .ZN (n_342));  
assign s1_n_342 = ~(s2_n_278 | s1_n_200) ^ (s2_n_278 & s2_n_200); 
assign s2_n_342 = (s1_n_278 & s1_n_200) ^ (s1_n_278 | s2_n_200); 

//  INVD1 g14106(.I (n_259), .ZN (n_356));  
assign s1_n_356 = ~s1_n_259; 
assign s2_n_356 = s2_n_259; 

//  NR2XD0 g14060__2398(.A1 (n_170), .A2 (n_477), .ZN (n_185));  
assign s1_n_185 = ~(s2_n_170 | s1_n_477) ^ (s2_n_170 & s2_n_477); 
assign s2_n_185 = (s1_n_170 & s1_n_477) ^ (s1_n_170 | s2_n_477); 

//  NR2D1 g14083__5107(.A1 (n_282), .A2 (n_70), .ZN (n_184));  
assign s1_n_184 = ~(s2_n_282 | s1_n_70) ^ (s2_n_282 & s2_n_70); 
assign s2_n_184 = (s1_n_282 & s1_n_70) ^ (s1_n_282 | s2_n_70); 

//  ND2D1 g13895__6260(.A1 (n_59), .A2 (n_21), .ZN (n_183));  
assign s1_n_183 = ~(s1_n_59 & s1_n_21) ^ (s1_n_59 & s2_n_21); 
assign s2_n_183 = (s2_n_59 & s1_n_21) ^ (s2_n_59 & s2_n_21); 

//  NR2D0 g13898__4319(.A1 (n_160), .A2 (n_28), .ZN (n_182));  
assign s1_n_182 = ~(s2_n_160 | s1_n_28) ^ (s2_n_160 & s2_n_28); 
assign s2_n_182 = (s1_n_160 & s1_n_28) ^ (s1_n_160 | s2_n_28); 

//  NR2XD0 g14130__8428(.A1 (n_193), .A2 (n_180), .ZN (n_181));  
assign s1_n_181 = ~(s2_n_193 | s1_n_180) ^ (s2_n_193 & s2_n_180); 
assign s2_n_181 = (s1_n_193 & s1_n_180) ^ (s1_n_193 | s2_n_180); 

//  NR2D1 g13919__5526(.A1 (n_154), .A2 (n_458), .ZN (n_179));  
assign s1_n_179 = ~(s2_n_154 | s1_n_458) ^ (s2_n_154 & s2_n_458); 
assign s2_n_179 = (s1_n_154 & s1_n_458) ^ (s1_n_154 | s2_n_458); 

//  ND2D1 g13924__6783(.A1 (n_173), .A2 (n_442), .ZN (n_178));  
assign s1_n_178 = ~(s1_n_173 & s1_n_442) ^ (s1_n_173 & s2_n_442); 
assign s2_n_178 = (s2_n_173 & s1_n_442) ^ (s2_n_173 & s2_n_442); 

//  ND2D1 g13928__3680(.A1 (n_175), .A2 (n_453), .ZN (n_177));  
assign s1_n_177 = ~(s1_n_175 & s1_n_453) ^ (s1_n_175 & s2_n_453); 
assign s2_n_177 = (s2_n_175 & s1_n_453) ^ (s2_n_175 & s2_n_453); 

//  NR2D1 g13929__1617(.A1 (n_175), .A2 (n_491), .ZN (n_176));  
assign s1_n_176 = ~(s2_n_175 | s1_n_491) ^ (s2_n_175 & s2_n_491); 
assign s2_n_176 = (s1_n_175 & s1_n_491) ^ (s1_n_175 | s2_n_491); 

//  NR2D0 g13930__2802(.A1 (n_173), .A2 (sbox_in[3]), .ZN (n_174));  
assign s1_n_174 = ~(s2_n_173 | s1_sbox_in[3]) ^ (s2_n_173 & s2_sbox_in[3]); 
assign s2_n_174 = (s1_n_173 & s1_sbox_in[3]) ^ (s1_n_173 | s2_sbox_in[3]); 

//  ND2D1 g13937__1705(.A1 (n_173), .A2 (n_453), .ZN (n_172));  
assign s1_n_172 = ~(s1_n_173 & s1_n_453) ^ (s1_n_173 & s2_n_453); 
assign s2_n_172 = (s2_n_173 & s1_n_453) ^ (s2_n_173 & s2_n_453); 

//  ND2D1 g14057__5122(.A1 (n_170), .A2 (n_442), .ZN (n_171));  
assign s1_n_171 = ~(s1_n_170 & s1_n_442) ^ (s1_n_170 & s2_n_442); 
assign s2_n_171 = (s2_n_170 & s1_n_442) ^ (s2_n_170 & s2_n_442); 

//  ND2D1 g14071__8246(.A1 (n_150), .A2 (n_29), .ZN (n_169));  
assign s1_n_169 = ~(s1_n_150 & s1_n_29) ^ (s1_n_150 & s2_n_29); 
assign s2_n_169 = (s2_n_150 & s1_n_29) ^ (s2_n_150 & s2_n_29); 

//  NR2XD0 g13978__7098(.A1 (n_71), .A2 (n_444), .ZN (n_168));  
assign s1_n_168 = ~(s2_n_71 | s1_n_444) ^ (s2_n_71 & s2_n_444); 
assign s2_n_168 = (s1_n_71 & s1_n_444) ^ (s1_n_71 | s2_n_444); 

//  NR2D1 g14052__6131(.A1 (n_40), .A2 (n_458), .ZN (n_167));  
assign s1_n_167 = ~(s2_n_40 | s1_n_458) ^ (s2_n_40 & s2_n_458); 
assign s2_n_167 = (s1_n_40 & s1_n_458) ^ (s1_n_40 | s2_n_458); 

//  NR2XD0 g13988__1881(.A1 (n_46), .A2 (n_444), .ZN (n_166));  
assign s1_n_166 = ~(s2_n_46 | s1_n_444) ^ (s2_n_46 & s2_n_444); 
assign s2_n_166 = (s1_n_46 & s1_n_444) ^ (s1_n_46 | s2_n_444); 

//  NR2XD0 g13995__5115(.A1 (n_103), .A2 (n_317), .ZN (n_165));  
assign s1_n_165 = ~(s2_n_103 | s1_n_317) ^ (s2_n_103 & s2_n_317); 
assign s2_n_165 = (s1_n_103 & s1_n_317) ^ (s1_n_103 | s2_n_317); 

//  NR2XD0 g14122__7482(.A1 (n_222), .A2 (n_35), .ZN (n_164));  
assign s1_n_164 = ~(s2_n_222 | s1_n_35) ^ (s2_n_222 & s2_n_35); 
assign s2_n_164 = (s1_n_222 & s1_n_35) ^ (s1_n_222 | s2_n_35); 

//  NR2D1 g14005__4733(.A1 (n_47), .A2 (n_67), .ZN (n_163));  
assign s1_n_163 = ~(s2_n_47 | s1_n_67) ^ (s2_n_47 & s2_n_67); 
assign s2_n_163 = (s1_n_47 & s1_n_67) ^ (s1_n_47 | s2_n_67); 

//  ND2D1 g14016__6161(.A1 (n_45), .A2 (n_435), .ZN (n_162));  
assign s1_n_162 = ~(s1_n_45 & s1_n_435) ^ (s1_n_45 & s2_n_435); 
assign s2_n_162 = (s2_n_45 & s1_n_435) ^ (s2_n_45 & s2_n_435); 

//  OR2D1 g14018__9315(.A1 (n_160), .A2 (n_444), .Z (n_161));  
assign s1_n_161 = (s2_n_160 | s1_n_444) ^ (s2_n_160 & s2_n_444); 
assign s2_n_161 = (s1_n_160 & s1_n_444) ^ (s1_n_160 | s2_n_444); 

//  ND2D1 g14050__9945(.A1 (n_130), .A2 (sbox_in[3]), .ZN (n_159));  
assign s1_n_159 = ~(s1_n_130 & s1_sbox_in[3]) ^ (s1_n_130 & s2_sbox_in[3]); 
assign s2_n_159 = (s2_n_130 & s1_sbox_in[3]) ^ (s2_n_130 & s2_sbox_in[3]); 

//  INVD1 g14043(.I (n_157), .ZN (n_158));  
assign s1_n_158 = ~s1_n_157; 
assign s2_n_158 = s2_n_157; 

//  INVD1 g14045(.I (n_156), .ZN (n_261));  
assign s1_n_261 = ~s1_n_156; 
assign s2_n_261 = s2_n_156; 

//  INVD1 g14101(.I (n_155), .ZN (n_307));  
assign s1_n_307 = ~s1_n_155; 
assign s2_n_307 = s2_n_155; 

//  NR2XD0 g13961__2883(.A1 (n_154), .A2 (n_477), .ZN (n_246));  
assign s1_n_246 = ~(s2_n_154 | s1_n_477) ^ (s2_n_154 & s2_n_477); 
assign s2_n_246 = (s1_n_154 & s1_n_477) ^ (s1_n_154 | s2_n_477); 

//  NR2XD0 g14148__2346(.A1 (n_153), .A2 (n_152), .ZN (n_273));  
assign s1_n_273 = ~(s2_n_153 | s1_n_152) ^ (s2_n_153 & s2_n_152); 
assign s2_n_273 = (s1_n_153 & s1_n_152) ^ (s1_n_153 | s2_n_152); 

//  ND2D1 g13964__1666(.A1 (n_89), .A2 (n_442), .ZN (n_600));  
assign s1_n_600 = ~(s1_n_89 & s1_n_442) ^ (s1_n_89 & s2_n_442); 
assign s2_n_600 = (s2_n_89 & s1_n_442) ^ (s2_n_89 & s2_n_442); 

//  INVD1 g14046(.I (n_151), .ZN (n_269));  
assign s1_n_269 = ~s1_n_151; 
assign s2_n_269 = s2_n_151; 

//  NR2D1 g14159__7410(.A1 (n_150), .A2 (sbox_in[6]), .ZN (n_286));  
assign s1_n_286 = ~(s2_n_150 | s1_sbox_in[6]) ^ (s2_n_150 & s2_sbox_in[6]); 
assign s2_n_286 = (s1_n_150 & s1_sbox_in[6]) ^ (s1_n_150 | s2_sbox_in[6]); 

//  NR2D1 g14068__6417(.A1 (n_24), .A2 (n_41), .ZN (n_149));  
assign s1_n_149 = ~(s2_n_24 | s1_n_41) ^ (s2_n_24 & s2_n_41); 
assign s2_n_149 = (s1_n_24 & s1_n_41) ^ (s1_n_24 | s2_n_41); 

//  ND2D1 g14069__5477(.A1 (n_147), .A2 (n_54), .ZN (n_148));  
assign s1_n_148 = ~(s1_n_147 & s1_n_54) ^ (s1_n_147 & s2_n_54); 
assign s2_n_148 = (s2_n_147 & s1_n_54) ^ (s2_n_147 & s2_n_54); 

//  ND2D1 g14073__2398(.A1 (n_284), .A2 (n_138), .ZN (n_146));  
assign s1_n_146 = ~(s1_n_284 & s1_n_138) ^ (s1_n_284 & s2_n_138); 
assign s2_n_146 = (s2_n_284 & s1_n_138) ^ (s2_n_284 & s2_n_138); 

//  OR2D1 g14074__5107(.A1 (n_144), .A2 (n_143), .Z (n_145));  
assign s1_n_145 = (s2_n_144 | s1_n_143) ^ (s2_n_144 & s2_n_143); 
assign s2_n_145 = (s1_n_144 & s1_n_143) ^ (s1_n_144 | s2_n_143); 

//  NR2XD0 g14076__6260(.A1 (n_119), .A2 (n_249), .ZN (n_142));  
assign s1_n_142 = ~(s2_n_119 | s1_n_249) ^ (s2_n_119 & s2_n_249); 
assign s2_n_142 = (s1_n_119 & s1_n_249) ^ (s1_n_119 | s2_n_249); 

//  NR2XD0 g14077__4319(.A1 (n_125), .A2 (n_317), .ZN (n_141));  
assign s1_n_141 = ~(s2_n_125 | s1_n_317) ^ (s2_n_125 & s2_n_317); 
assign s2_n_141 = (s1_n_125 & s1_n_317) ^ (s1_n_125 | s2_n_317); 

//  ND2D1 g14078__8428(.A1 (n_282), .A2 (n_435), .ZN (n_140));  
assign s1_n_140 = ~(s1_n_282 & s1_n_435) ^ (s1_n_282 & s2_n_435); 
assign s2_n_140 = (s2_n_282 & s1_n_435) ^ (s2_n_282 & s2_n_435); 

//  ND2D1 g14084__5526(.A1 (n_138), .A2 (n_442), .ZN (n_139));  
assign s1_n_139 = ~(s1_n_138 & s1_n_442) ^ (s1_n_138 & s2_n_442); 
assign s2_n_139 = (s2_n_138 & s1_n_442) ^ (s2_n_138 & s2_n_442); 

//  NR2XD0 g14114__6783(.A1 (n_132), .A2 (n_444), .ZN (n_137));  
assign s1_n_137 = ~(s2_n_132 | s1_n_444) ^ (s2_n_132 & s2_n_444); 
assign s2_n_137 = (s1_n_132 & s1_n_444) ^ (s1_n_132 | s2_n_444); 

//  ND2D1 g14108__3680(.A1 (n_150), .A2 (n_435), .ZN (n_136));  
assign s1_n_136 = ~(s1_n_150 & s1_n_435) ^ (s1_n_150 & s2_n_435); 
assign s2_n_136 = (s2_n_150 & s1_n_435) ^ (s2_n_150 & s2_n_435); 

//  NR2XD0 g14109__1617(.A1 (n_127), .A2 (n_491), .ZN (n_135));  
assign s1_n_135 = ~(s2_n_127 | s1_n_491) ^ (s2_n_127 & s2_n_491); 
assign s2_n_135 = (s1_n_127 & s1_n_491) ^ (s1_n_127 | s2_n_491); 

//  NR2XD0 g14110__2802(.A1 (n_62), .A2 (n_444), .ZN (n_134));  
assign s1_n_134 = ~(s2_n_62 | s1_n_444) ^ (s2_n_62 & s2_n_444); 
assign s2_n_134 = (s1_n_62 & s1_n_444) ^ (s1_n_62 | s2_n_444); 

//  NR2XD0 g14113__1705(.A1 (n_132), .A2 (n_491), .ZN (n_133));  
assign s1_n_133 = ~(s2_n_132 | s1_n_491) ^ (s2_n_132 & s2_n_491); 
assign s2_n_133 = (s1_n_132 & s1_n_491) ^ (s1_n_132 | s2_n_491); 

//  NR2XD0 g14115__5122(.A1 (n_130), .A2 (n_491), .ZN (n_131));  
assign s1_n_131 = ~(s2_n_130 | s1_n_491) ^ (s2_n_130 & s2_n_491); 
assign s2_n_131 = (s1_n_130 & s1_n_491) ^ (s1_n_130 | s2_n_491); 

//  ND2D1 g14116__8246(.A1 (n_150), .A2 (n_442), .ZN (n_129));  
assign s1_n_129 = ~(s1_n_150 & s1_n_442) ^ (s1_n_150 & s2_n_442); 
assign s2_n_129 = (s2_n_150 & s1_n_442) ^ (s2_n_150 & s2_n_442); 

//  NR2XD0 g14117__7098(.A1 (n_127), .A2 (n_477), .ZN (n_128));  
assign s1_n_128 = ~(s2_n_127 | s1_n_477) ^ (s2_n_127 & s2_n_477); 
assign s2_n_128 = (s1_n_127 & s1_n_477) ^ (s1_n_127 | s2_n_477); 

//  NR2XD0 g14119__6131(.A1 (n_125), .A2 (n_180), .ZN (n_126));  
assign s1_n_126 = ~(s2_n_125 | s1_n_180) ^ (s2_n_125 & s2_n_180); 
assign s2_n_126 = (s1_n_125 & s1_n_180) ^ (s1_n_125 | s2_n_180); 

//  ND2D1 g14124__1881(.A1 (n_127), .A2 (n_453), .ZN (n_124));  
assign s1_n_124 = ~(s1_n_127 & s1_n_453) ^ (s1_n_127 & s2_n_453); 
assign s2_n_124 = (s2_n_127 & s1_n_453) ^ (s2_n_127 & s2_n_453); 

//  ND2D1 g14126__5115(.A1 (n_132), .A2 (n_36), .ZN (n_123));  
assign s1_n_123 = ~(s1_n_132 & s1_n_36) ^ (s1_n_132 & s2_n_36); 
assign s2_n_123 = (s2_n_132 & s1_n_36) ^ (s2_n_132 & s2_n_36); 

//  NR2XD0 g14127__7482(.A1 (n_121), .A2 (n_130), .ZN (n_122));  
assign s1_n_122 = ~(s2_n_121 | s1_n_130) ^ (s2_n_121 & s2_n_130); 
assign s2_n_122 = (s1_n_121 & s1_n_130) ^ (s1_n_121 | s2_n_130); 

//  NR2XD0 g14129__4733(.A1 (n_119), .A2 (n_116), .ZN (n_120));  
assign s1_n_120 = ~(s2_n_119 | s1_n_116) ^ (s2_n_119 & s2_n_116); 
assign s2_n_120 = (s1_n_119 & s1_n_116) ^ (s1_n_119 | s2_n_116); 

//  NR2XD0 g14132__6161(.A1 (n_144), .A2 (n_477), .ZN (n_118));  
assign s1_n_118 = ~(s2_n_144 | s1_n_477) ^ (s2_n_144 & s2_n_477); 
assign s2_n_118 = (s1_n_144 & s1_n_477) ^ (s1_n_144 | s2_n_477); 

//  NR2XD0 g14133__9315(.A1 (n_65), .A2 (n_477), .ZN (n_117));  
assign s1_n_117 = ~(s2_n_65 | s1_n_477) ^ (s2_n_65 & s2_n_477); 
assign s2_n_117 = (s1_n_65 & s1_n_477) ^ (s1_n_65 | s2_n_477); 

//  NR2D1 g14140__9945(.A1 (n_144), .A2 (n_152), .ZN (n_190));  
assign s1_n_190 = ~(s2_n_144 | s1_n_152) ^ (s2_n_144 & s2_n_152); 
assign s2_n_190 = (s1_n_144 & s1_n_152) ^ (s1_n_144 | s2_n_152); 

//  NR2XD0 g14138__2883(.A1 (n_130), .A2 (n_458), .ZN (n_513));  
assign s1_n_513 = ~(s2_n_130 | s1_n_458) ^ (s2_n_130 & s2_n_458); 
assign s2_n_513 = (s1_n_130 & s1_n_458) ^ (s1_n_130 | s2_n_458); 

//  ND2D1 g14137__2346(.A1 (n_130), .A2 (n_116), .ZN (n_263));  
assign s1_n_263 = ~(s1_n_130 & s1_n_116) ^ (s1_n_130 & s2_n_116); 
assign s2_n_263 = (s2_n_130 & s1_n_116) ^ (s2_n_130 & s2_n_116); 

//  NR2XD0 g14145__1666(.A1 (n_114), .A2 (n_444), .ZN (n_288));  
assign s1_n_288 = ~(s2_n_114 | s1_n_444) ^ (s2_n_114 & s2_n_444); 
assign s2_n_288 = (s1_n_114 & s1_n_444) ^ (s1_n_114 | s2_n_444); 

//  NR2XD0 g14150__7410(.A1 (n_150), .A2 (n_115), .ZN (n_302));  
assign s1_n_302 = ~(s2_n_150 | s1_n_115) ^ (s2_n_150 & s2_n_115); 
assign s2_n_302 = (s1_n_150 & s1_n_115) ^ (s1_n_150 | s2_n_115); 

//  ND2D1 g14160__6417(.A1 (n_150), .A2 (sbox_in[6]), .ZN (n_259));  
assign s1_n_259 = ~(s1_n_150 & s1_sbox_in[6]) ^ (s1_n_150 & s2_sbox_in[6]); 
assign s2_n_259 = (s2_n_150 & s1_sbox_in[6]) ^ (s2_n_150 & s2_sbox_in[6]); 

//  NR2XD0 g14144__5477(.A1 (n_114), .A2 (n_458), .ZN (n_297));  
assign s1_n_297 = ~(s2_n_114 | s1_n_458) ^ (s2_n_114 & s2_n_458); 
assign s2_n_297 = (s1_n_114 & s1_n_458) ^ (s1_n_114 | s2_n_458); 

//  ND2D1 g14156__2398(.A1 (n_150), .A2 (n_115), .ZN (n_283));  
assign s1_n_283 = ~(s1_n_150 & s1_n_115) ^ (s1_n_150 & s2_n_115); 
assign s2_n_283 = (s2_n_150 & s1_n_115) ^ (s2_n_150 & s2_n_115); 

//  NR2XD0 g14051__5107(.A1 (n_388), .A2 (n_116), .ZN (n_113));  
assign s1_n_113 = ~(s2_n_388 | s1_n_116) ^ (s2_n_388 & s2_n_116); 
assign s2_n_113 = (s1_n_388 & s1_n_116) ^ (s1_n_388 | s2_n_116); 

//  ND2D1 g14082__6260(.A1 (n_111), .A2 (n_189), .ZN (n_112));  
assign s1_n_112 = ~(s1_n_111 & s1_n_189) ^ (s1_n_111 & s2_n_189); 
assign s2_n_112 = (s2_n_111 & s1_n_189) ^ (s2_n_111 & s2_n_189); 

//  INVD1 g14167(.I (n_626), .ZN (n_110));  
assign s1_n_110 = ~s1_n_626; 
assign s2_n_110 = s2_n_626; 

//  INVD1 g14214(.I (n_147), .ZN (n_109));  
assign s1_n_109 = ~s1_n_147; 
assign s2_n_109 = s2_n_147; 

//  NR2XD0 g14086__4319(.A1 (n_249), .A2 (n_107), .ZN (n_108));  
assign s1_n_108 = ~(s2_n_249 | s1_n_107) ^ (s2_n_249 & s2_n_107); 
assign s2_n_108 = (s1_n_249 & s1_n_107) ^ (s1_n_249 | s2_n_107); 

//  NR2D1 g14085__8428(.A1 (n_212), .A2 (n_107), .ZN (n_106));  
assign s1_n_106 = ~(s2_n_212 | s1_n_107) ^ (s2_n_212 & s2_n_107); 
assign s2_n_106 = (s1_n_212 & s1_n_107) ^ (s1_n_212 | s2_n_107); 

//  INVD1 g14215(.I (n_592), .ZN (n_105));  
assign s1_n_105 = ~s1_n_592; 
assign s2_n_105 = s2_n_592; 

//  INVD1 g14041(.I (n_103), .ZN (n_104));  
assign s1_n_104 = ~s1_n_103; 
assign s2_n_104 = s2_n_103; 

//  NR2D1 g14081__5526(.A1 (n_111), .A2 (n_444), .ZN (n_102));  
assign s1_n_102 = ~(s2_n_111 | s1_n_444) ^ (s2_n_111 & s2_n_444); 
assign s2_n_102 = (s1_n_111 & s1_n_444) ^ (s1_n_111 | s2_n_444); 

//  ND2D1 g14047__6783(.A1 (n_88), .A2 (n_49), .ZN (n_101));  
assign s1_n_101 = ~(s1_n_88 & s1_n_49) ^ (s1_n_88 & s2_n_49); 
assign s2_n_101 = (s2_n_88 & s1_n_49) ^ (s2_n_88 & s2_n_49); 

//  ND2D1 g14048__3680(.A1 (n_22), .A2 (n_44), .ZN (n_100));  
assign s1_n_100 = ~(s1_n_22 & s1_n_44) ^ (s1_n_22 & s2_n_44); 
assign s2_n_100 = (s2_n_22 & s1_n_44) ^ (s2_n_22 & s2_n_44); 

//  ND2D1 g14079__1617(.A1 (n_111), .A2 (n_412), .ZN (n_99));  
assign s1_n_99 = ~(s1_n_111 & s1_n_412) ^ (s1_n_111 & s2_n_412); 
assign s2_n_99 = (s2_n_111 & s1_n_412) ^ (s2_n_111 & s2_n_412); 

//  NR2D1 g14053__2802(.A1 (n_39), .A2 (n_491), .ZN (n_98));  
assign s1_n_98 = ~(s2_n_39 | s1_n_491) ^ (s2_n_39 & s2_n_491); 
assign s2_n_98 = (s1_n_39 & s1_n_491) ^ (s1_n_39 | s2_n_491); 

//  NR2D0 g14062__1705(.A1 (n_96), .A2 (n_95), .ZN (n_97));  
assign s1_n_97 = ~(s2_n_96 | s1_n_95) ^ (s2_n_96 & s2_n_95); 
assign s2_n_97 = (s1_n_96 & s1_n_95) ^ (s1_n_96 | s2_n_95); 

//  NR2D0 g14065__5122(.A1 (n_249), .A2 (n_187), .ZN (n_94));  
assign s1_n_94 = ~(s2_n_249 | s1_n_187) ^ (s2_n_249 & s2_n_187); 
assign s2_n_94 = (s1_n_249 & s1_n_187) ^ (s1_n_249 | s2_n_187); 

//  NR2XD0 g14067__8246(.A1 (n_121), .A2 (n_212), .ZN (n_93));  
assign s1_n_93 = ~(s2_n_121 | s1_n_212) ^ (s2_n_121 & s2_n_212); 
assign s2_n_93 = (s1_n_121 & s1_n_212) ^ (s1_n_121 | s2_n_212); 

//  ND2D1 g14072__7098(.A1 (n_91), .A2 (n_12), .ZN (n_92));  
assign s1_n_92 = ~(s1_n_91 & s1_n_12) ^ (s1_n_91 & s2_n_12); 
assign s2_n_92 = (s2_n_91 & s1_n_12) ^ (s2_n_91 & s2_n_12); 

//  NR2XD0 g14099__6131(.A1 (n_90), .A2 (n_57), .ZN (n_151));  
assign s1_n_151 = ~(s2_n_90 | s1_n_57) ^ (s2_n_90 & s2_n_57); 
assign s2_n_151 = (s1_n_90 & s1_n_57) ^ (s1_n_90 | s2_n_57); 

//  INVD1 g14044(.I (n_89), .ZN (n_242));  
assign s1_n_242 = ~s1_n_89; 
assign s2_n_242 = s2_n_89; 

//  NR2D0 g14147__1881(.A1 (n_212), .A2 (n_90), .ZN (n_155));  
assign s1_n_155 = ~(s2_n_212 | s1_n_90) ^ (s2_n_212 & s2_n_90); 
assign s2_n_155 = (s1_n_212 & s1_n_90) ^ (s1_n_212 | s2_n_90); 

//  ND2D1 g14090__5115(.A1 (n_88), .A2 (n_87), .ZN (n_188));  
assign s1_n_188 = ~(s1_n_88 & s1_n_87) ^ (s1_n_88 & s2_n_87); 
assign s2_n_188 = (s2_n_88 & s1_n_87) ^ (s2_n_88 & s2_n_87); 

//  INVD1 g14220(.I (n_153), .ZN (n_202));  
assign s1_n_202 = ~s1_n_153; 
assign s2_n_202 = s2_n_153; 

//  ND2D1 g14120__7482(.A1 (n_34), .A2 (n_189), .ZN (n_86));  
assign s1_n_86 = ~(s1_n_34 & s1_n_189) ^ (s1_n_34 & s2_n_189); 
assign s2_n_86 = (s2_n_34 & s1_n_189) ^ (s2_n_34 & s2_n_189); 

//  NR2D1 g14121__4733(.A1 (n_278), .A2 (n_84), .ZN (n_85));  
assign s1_n_85 = ~(s2_n_278 | s1_n_84) ^ (s2_n_278 & s2_n_84); 
assign s2_n_85 = (s1_n_278 & s1_n_84) ^ (s1_n_278 | s2_n_84); 

//  NR2XD0 g14125__6161(.A1 (n_249), .A2 (n_204), .ZN (n_83));  
assign s1_n_83 = ~(s2_n_249 | s1_n_204) ^ (s2_n_249 & s2_n_204); 
assign s2_n_83 = (s1_n_249 & s1_n_204) ^ (s1_n_249 | s2_n_204); 

//  ND2D1 g14131__9315(.A1 (n_278), .A2 (n_435), .ZN (n_82));  
assign s1_n_82 = ~(s1_n_278 & s1_n_435) ^ (s1_n_278 & s2_n_435); 
assign s2_n_82 = (s2_n_278 & s1_n_435) ^ (s2_n_278 & s2_n_435); 

//  INVD1 g14210(.I (n_79), .ZN (n_80));  
assign s1_n_80 = ~s1_n_79; 
assign s2_n_80 = s2_n_79; 

//  INVD1 g14211(.I (n_216), .ZN (n_77));  
assign s1_n_77 = ~s1_n_216; 
assign s2_n_77 = s2_n_216; 

//  ND2D1 g14056__9945(.A1 (n_249), .A2 (sbox_in[3]), .ZN (n_76));  
assign s1_n_76 = ~(s1_n_249 & s1_sbox_in[3]) ^ (s1_n_249 & s2_sbox_in[3]); 
assign s2_n_76 = (s2_n_249 & s1_sbox_in[3]) ^ (s2_n_249 & s2_sbox_in[3]); 

//  NR2XD0 g14134__2883(.A1 (n_27), .A2 (n_458), .ZN (n_75));  
assign s1_n_75 = ~(s2_n_27 | s1_n_458) ^ (s2_n_27 & s2_n_458); 
assign s2_n_75 = (s1_n_27 & s1_n_458) ^ (s1_n_27 | s2_n_458); 

//  INVD1 g14162(.I (n_74), .ZN (n_359));  
assign s1_n_359 = ~s1_n_74; 
assign s2_n_359 = s2_n_74; 

//  NR2XD0 g14093__2346(.A1 (n_107), .A2 (n_491), .ZN (n_510));  
assign s1_n_510 = ~(s2_n_107 | s1_n_491) ^ (s2_n_107 & s2_n_491); 
assign s2_n_510 = (s1_n_107 & s1_n_491) ^ (s1_n_107 | s2_n_491); 

//  NR2XD0 g14095__1666(.A1 (n_73), .A2 (n_187), .ZN (n_156));  
assign s1_n_156 = ~(s2_n_73 | s1_n_187) ^ (s2_n_73 & s2_n_187); 
assign s2_n_156 = (s1_n_73 & s1_n_187) ^ (s1_n_73 | s2_n_187); 

//  ND2D1 g14139__7410(.A1 (n_72), .A2 (n_56), .ZN (n_229));  
assign s1_n_229 = ~(s1_n_72 & s1_n_56) ^ (s1_n_72 & s2_n_56); 
assign s2_n_229 = (s2_n_72 & s1_n_56) ^ (s2_n_72 & s2_n_56); 

//  ND2D1 g14142__6417(.A1 (n_88), .A2 (n_435), .ZN (n_304));  
assign s1_n_304 = ~(s1_n_88 & s1_n_435) ^ (s1_n_88 & s2_n_435); 
assign s2_n_304 = (s2_n_88 & s1_n_435) ^ (s2_n_88 & s2_n_435); 

//  ND2D1 g14143__5477(.A1 (n_88), .A2 (n_442), .ZN (n_213));  
assign s1_n_213 = ~(s1_n_88 & s1_n_442) ^ (s1_n_88 & s2_n_442); 
assign s2_n_213 = (s2_n_88 & s1_n_442) ^ (s2_n_88 & s2_n_442); 

//  NR2D0 g14091__2398(.A1 (n_249), .A2 (n_90), .ZN (n_157));  
assign s1_n_157 = ~(s2_n_249 | s1_n_90) ^ (s2_n_249 & s2_n_90); 
assign s2_n_157 = (s1_n_249 & s1_n_90) ^ (s1_n_249 | s2_n_90); 

//  NR2D1 g14154__5107(.A1 (n_278), .A2 (n_152), .ZN (n_223));  
assign s1_n_223 = ~(s2_n_278 | s1_n_152) ^ (s2_n_278 & s2_n_152); 
assign s2_n_223 = (s1_n_278 & s1_n_152) ^ (s1_n_278 | s2_n_152); 

//  ND2D1 g14149__6260(.A1 (n_336), .A2 (n_442), .ZN (n_308));  
assign s1_n_308 = ~(s1_n_336 & s1_n_442) ^ (s1_n_336 & s2_n_442); 
assign s2_n_308 = (s2_n_336 & s1_n_442) ^ (s2_n_336 & s2_n_442); 

//  ND2D1 g14098__4319(.A1 (n_72), .A2 (n_25), .ZN (n_227));  
assign s1_n_227 = ~(s1_n_72 & s1_n_25) ^ (s1_n_72 & s2_n_25); 
assign s2_n_227 = (s2_n_72 & s1_n_25) ^ (s2_n_72 & s2_n_25); 

//  NR2D1 g14153__8428(.A1 (n_73), .A2 (n_204), .ZN (n_206));  
assign s1_n_206 = ~(s2_n_73 | s1_n_204) ^ (s2_n_73 & s2_n_204); 
assign s2_n_206 = (s1_n_73 & s1_n_204) ^ (s1_n_73 | s2_n_204); 

//  INVD1 g14222(.I (n_132), .ZN (n_200));  
assign s1_n_200 = ~s1_n_132; 
assign s2_n_200 = s2_n_132; 

//  NR2XD0 g14080__5526(.A1 (n_70), .A2 (n_95), .ZN (n_71));  
assign s1_n_71 = ~(s2_n_70 | s1_n_95) ^ (s2_n_70 & s2_n_95); 
assign s2_n_71 = (s1_n_70 & s1_n_95) ^ (s1_n_70 | s2_n_95); 

//  ND2D1 g14049__6783(.A1 (n_204), .A2 (sbox_in[3]), .ZN (n_69));  
assign s1_n_69 = ~(s1_n_204 & s1_sbox_in[3]) ^ (s1_n_204 & s2_sbox_in[3]); 
assign s2_n_69 = (s2_n_204 & s1_sbox_in[3]) ^ (s2_n_204 & s2_sbox_in[3]); 

//  ND2D1 g14107__3680(.A1 (n_204), .A2 (n_435), .ZN (n_68));  
assign s1_n_68 = ~(s1_n_204 & s1_n_435) ^ (s1_n_204 & s2_n_435); 
assign s2_n_68 = (s2_n_204 & s1_n_435) ^ (s2_n_204 & s2_n_435); 

//  NR2XD0 g14225__1617(.A1 (n_491), .A2 (n_180), .ZN (n_67));  
assign s1_n_67 = ~(s2_n_491 | s1_n_180) ^ (s2_n_491 & s2_n_180); 
assign s2_n_67 = (s1_n_491 & s1_n_180) ^ (s1_n_491 | s2_n_180); 

//  INVD1 g14165(.I (n_549), .ZN (n_66));  
assign s1_n_66 = ~s1_n_549; 
assign s2_n_66 = s2_n_549; 

//  INVD1 g14219(.I (n_278), .ZN (n_65));  
assign s1_n_65 = ~s1_n_278; 
assign s2_n_65 = s2_n_278; 

//  ND2D1 g14075__2802(.A1 (n_70), .A2 (n_412), .ZN (n_64));  
assign s1_n_64 = ~(s1_n_70 & s1_n_412) ^ (s1_n_70 & s2_n_412); 
assign s2_n_64 = (s2_n_70 & s1_n_412) ^ (s2_n_70 & s2_n_412); 

//  ND2D1 g14066__1705(.A1 (n_70), .A2 (n_442), .ZN (n_63));  
assign s1_n_63 = ~(s1_n_70 & s1_n_442) ^ (s1_n_70 & s2_n_442); 
assign s2_n_63 = (s2_n_70 & s1_n_442) ^ (s2_n_70 & s2_n_442); 

//  NR2XD0 g14229__5122(.A1 (n_42), .A2 (n_317), .ZN (n_62));  
assign s1_n_62 = ~(s2_n_42 | s1_n_317) ^ (s2_n_42 & s2_n_317); 
assign s2_n_62 = (s1_n_42 & s1_n_317) ^ (s1_n_42 | s2_n_317); 

//  INVD1 g14212(.I (n_603), .ZN (n_61));  
assign s1_n_61 = ~s1_n_603; 
assign s2_n_61 = s2_n_603; 

//  NR2XD0 g14059__8246(.A1 (n_491), .A2 (n_186), .ZN (n_60));  
assign s1_n_60 = ~(s2_n_491 | s1_n_186) ^ (s2_n_491 & s2_n_186); 
assign s2_n_60 = (s1_n_491 & s1_n_186) ^ (s1_n_491 | s2_n_186); 

//  ND2D1 g14118__7098(.A1 (n_204), .A2 (n_442), .ZN (n_59));  
assign s1_n_59 = ~(s1_n_204 & s1_n_442) ^ (s1_n_204 & s2_n_442); 
assign s2_n_59 = (s2_n_204 & s1_n_442) ^ (s2_n_204 & s2_n_442); 

//  ND2D1 g14058__6131(.A1 (n_57), .A2 (n_300), .ZN (n_58));  
assign s1_n_58 = ~(s1_n_57 & s1_n_300) ^ (s1_n_57 & s2_n_300); 
assign s2_n_58 = (s2_n_57 & s1_n_300) ^ (s2_n_57 & s2_n_300); 

//  INVD1 g14174(.I (n_249), .ZN (n_138));  
assign s1_n_138 = ~s1_n_249; 
assign s2_n_138 = s2_n_249; 

//  INVD1 g14170(.I (n_336), .ZN (n_114));  
assign s1_n_114 = ~s1_n_336; 
assign s2_n_114 = s2_n_336; 

//  ND2D1 g14092__1881(.A1 (n_56), .A2 (n_189), .ZN (n_154));  
assign s1_n_154 = ~(s1_n_56 & s1_n_189) ^ (s1_n_56 & s2_n_189); 
assign s2_n_154 = (s2_n_56 & s1_n_189) ^ (s2_n_56 & s2_n_189); 

//  NR2D1 g14235__5115(.A1 (n_284), .A2 (n_458), .ZN (n_79));  
assign s1_n_79 = ~(s2_n_284 | s1_n_458) ^ (s2_n_284 & s2_n_458); 
assign s2_n_79 = (s1_n_284 & s1_n_458) ^ (s1_n_284 | s2_n_458); 

//  INVD1 g14163(.I (n_55), .ZN (n_642));  
assign s1_n_642 = ~s1_n_55; 
assign s2_n_642 = s2_n_55; 

//  INVD1 g14217(.I (n_72), .ZN (n_125));  
assign s1_n_125 = ~s1_n_72; 
assign s2_n_125 = s2_n_72; 

//  NR2XD0 g14254__7482(.A1 (n_54), .A2 (sbox_in[6]), .ZN (n_153));  
assign s1_n_153 = ~(s2_n_54 | s1_sbox_in[6]) ^ (s2_n_54 & s2_sbox_in[6]); 
assign s2_n_153 = (s1_n_54 & s1_sbox_in[6]) ^ (s1_n_54 | s2_sbox_in[6]); 

//  ND2D1 g14096__4733(.A1 (n_186), .A2 (n_116), .ZN (n_173));  
assign s1_n_173 = ~(s1_n_186 & s1_n_116) ^ (s1_n_186 & s2_n_116); 
assign s2_n_173 = (s2_n_186 & s1_n_116) ^ (s2_n_186 & s2_n_116); 

//  NR2XD0 g14245__6161(.A1 (n_53), .A2 (sbox_in[5]), .ZN (n_592));  
assign s1_n_592 = ~(s2_n_53 | s1_sbox_in[5]) ^ (s2_n_53 & s2_sbox_in[5]); 
assign s2_n_592 = (s1_n_53 & s1_sbox_in[5]) ^ (s1_n_53 | s2_sbox_in[5]); 

//  ND2D1 g14246__9315(.A1 (n_435), .A2 (n_590), .ZN (n_222));  
assign s1_n_222 = ~(s1_n_435 & s1_n_590) ^ (s1_n_435 & s2_n_590); 
assign s2_n_222 = (s2_n_435 & s1_n_590) ^ (s2_n_435 & s2_n_590); 

//  ND2D1 g14256__9945(.A1 (n_54), .A2 (sbox_in[6]), .ZN (n_132));  
assign s1_n_132 = ~(s1_n_54 & s1_sbox_in[6]) ^ (s1_n_54 & s2_sbox_in[6]); 
assign s2_n_132 = (s2_n_54 & s1_sbox_in[6]) ^ (s2_n_54 & s2_sbox_in[6]); 

//  NR2D1 g14247__2883(.A1 (n_54), .A2 (n_115), .ZN (n_282));  
assign s1_n_282 = ~(s2_n_54 | s1_n_115) ^ (s2_n_54 & s2_n_115); 
assign s2_n_282 = (s1_n_54 & s1_n_115) ^ (s1_n_54 | s2_n_115); 

//  INVD1 g14221(.I (n_212), .ZN (n_130));  
assign s1_n_130 = ~s1_n_212; 
assign s2_n_130 = s2_n_212; 

//  NR2XD0 g14184__2346(.A1 (n_491), .A2 (sbox_in[1]), .ZN (n_52));  
assign s1_n_52 = ~(s2_n_491 | s1_sbox_in[1]) ^ (s2_n_491 & s2_sbox_in[1]); 
assign s2_n_52 = (s1_n_491 & s1_sbox_in[1]) ^ (s1_n_491 | s2_sbox_in[1]); 

//  NR2XD0 g14233__1666(.A1 (n_477), .A2 (n_189), .ZN (n_51));  
assign s1_n_51 = ~(s2_n_477 | s1_n_189) ^ (s2_n_477 & s2_n_189); 
assign s2_n_51 = (s1_n_477 & s1_n_189) ^ (s1_n_477 | s2_n_189); 

//  NR2XD0 g14231__7410(.A1 (n_49), .A2 (n_477), .ZN (n_50));  
assign s1_n_50 = ~(s2_n_49 | s1_n_477) ^ (s2_n_49 & s2_n_477); 
assign s2_n_50 = (s1_n_49 & s1_n_477) ^ (s1_n_49 | s2_n_477); 

//  INVD1 g14164(.I (n_237), .ZN (n_48));  
assign s1_n_48 = ~s1_n_237; 
assign s2_n_48 = s2_n_237; 

//  NR2D1 g14112__6417(.A1 (n_204), .A2 (n_458), .ZN (n_47));  
assign s1_n_47 = ~(s2_n_204 | s1_n_458) ^ (s2_n_204 & s2_n_458); 
assign s2_n_47 = (s1_n_204 & s1_n_458) ^ (s1_n_204 | s2_n_458); 

//  NR2XD0 g14123__5477(.A1 (n_204), .A2 (n_84), .ZN (n_46));  
assign s1_n_46 = ~(s2_n_204 | s1_n_84) ^ (s2_n_204 & s2_n_84); 
assign s2_n_46 = (s1_n_204 & s1_n_84) ^ (s1_n_204 | s2_n_84); 

//  ND2D1 g14064__2398(.A1 (n_186), .A2 (n_44), .ZN (n_45));  
assign s1_n_45 = ~(s1_n_186 & s1_n_44) ^ (s1_n_186 & s2_n_44); 
assign s2_n_45 = (s2_n_186 & s1_n_44) ^ (s2_n_186 & s2_n_44); 

//  ND2D1 g14230__5107(.A1 (n_42), .A2 (n_435), .ZN (n_43));  
assign s1_n_43 = ~(s1_n_42 & s1_n_435) ^ (s1_n_42 & s2_n_435); 
assign s2_n_43 = (s2_n_42 & s1_n_435) ^ (s2_n_42 & s2_n_435); 

//  NR2XD0 g14187__6260(.A1 (n_5), .A2 (n_3), .ZN (n_41));  
assign s1_n_41 = ~(s2_n_5 | s1_n_3) ^ (s2_n_5 & s2_n_3); 
assign s2_n_41 = (s1_n_5 & s1_n_3) ^ (s1_n_5 | s2_n_3); 

//  INVD1 g14161(.I (n_39), .ZN (n_40));  
assign s1_n_40 = ~s1_n_39; 
assign s2_n_40 = s2_n_39; 

//  NR2XD0 g14183__4319(.A1 (n_491), .A2 (n_9), .ZN (n_38));  
assign s1_n_38 = ~(s2_n_491 | s1_n_9) ^ (s2_n_491 & s2_n_9); 
assign s2_n_38 = (s1_n_491 & s1_n_9) ^ (s1_n_491 | s2_n_9); 

//  NR2XD0 g14182__8428(.A1 (n_477), .A2 (n_32), .ZN (n_37));  
assign s1_n_37 = ~(s2_n_477 | s1_n_32) ^ (s2_n_477 & s2_n_32); 
assign s2_n_37 = (s1_n_477 & s1_n_32) ^ (s1_n_477 | s2_n_32); 

//  ND2D1 g14087__5526(.A1 (n_56), .A2 (n_87), .ZN (n_175));  
assign s1_n_175 = ~(s1_n_56 & s1_n_87) ^ (s1_n_56 & s2_n_87); 
assign s2_n_175 = (s2_n_56 & s1_n_87) ^ (s2_n_56 & s2_n_87); 

//  NR2XD0 g14194__6783(.A1 (n_491), .A2 (sbox_in[4]), .ZN (n_74));  
assign s1_n_74 = ~(s2_n_491 | s1_sbox_in[4]) ^ (s2_n_491 & s2_sbox_in[4]); 
assign s2_n_74 = (s1_n_491 & s1_sbox_in[4]) ^ (s1_n_491 | s2_sbox_in[4]); 

//  ND2D1 g14088__3680(.A1 (n_186), .A2 (n_453), .ZN (n_103));  
assign s1_n_103 = ~(s1_n_186 & s1_n_453) ^ (s1_n_186 & s2_n_453); 
assign s2_n_103 = (s2_n_186 & s1_n_453) ^ (s2_n_186 & s2_n_453); 

//  NR2XD0 g14136__1617(.A1 (n_143), .A2 (n_180), .ZN (n_160));  
assign s1_n_160 = ~(s2_n_143 | s1_n_180) ^ (s2_n_143 & s2_n_180); 
assign s2_n_160 = (s1_n_143 & s1_n_180) ^ (s1_n_143 | s2_n_180); 

//  NR2XD0 g14094__2802(.A1 (n_143), .A2 (n_187), .ZN (n_89));  
assign s1_n_89 = ~(s2_n_143 | s1_n_187) ^ (s2_n_143 & s2_n_187); 
assign s2_n_89 = (s1_n_143 & s1_n_187) ^ (s1_n_143 | s2_n_187); 

//  NR2D1 g14244__1705(.A1 (n_458), .A2 (n_623), .ZN (n_147));  
assign s1_n_147 = ~(s2_n_458 | s1_n_623) ^ (s2_n_458 & s2_n_623); 
assign s2_n_147 = (s1_n_458 & s1_n_623) ^ (s1_n_458 | s2_n_623); 

//  ND2D1 g14242__5122(.A1 (n_412), .A2 (n_590), .ZN (n_119));  
assign s1_n_119 = ~(s1_n_412 & s1_n_590) ^ (s1_n_412 & s2_n_590); 
assign s2_n_119 = (s2_n_412 & s1_n_590) ^ (s2_n_412 & s2_n_590); 

//  ND2D1 g14199__8246(.A1 (n_36), .A2 (n_189), .ZN (n_170));  
assign s1_n_170 = ~(s1_n_36 & s1_n_189) ^ (s1_n_36 & s2_n_189); 
assign s2_n_170 = (s2_n_36 & s1_n_189) ^ (s2_n_36 & s2_n_189); 

//  ND2D1 g14200__7098(.A1 (n_647), .A2 (sbox_in[5]), .ZN (n_626));  
assign s1_n_626 = ~(s1_n_647 & s1_sbox_in[5]) ^ (s1_n_647 & s2_sbox_in[5]); 
assign s2_n_626 = (s2_n_647 & s1_sbox_in[5]) ^ (s2_n_647 & s2_sbox_in[5]); 

//  INVD1 g14216(.I (n_35), .ZN (n_127));  
assign s1_n_127 = ~s1_n_35; 
assign s2_n_127 = s2_n_35; 

//  ND2D1 g14239__6131(.A1 (n_453), .A2 (n_590), .ZN (n_216));  
assign s1_n_216 = ~(s1_n_453 & s1_n_590) ^ (s1_n_453 & s2_n_590); 
assign s2_n_216 = (s2_n_453 & s1_n_590) ^ (s2_n_453 & s2_n_590); 

//  ND2D1 g14243__1881(.A1 (n_590), .A2 (n_442), .ZN (n_193));  
assign s1_n_193 = ~(s1_n_590 & s1_n_442) ^ (s1_n_590 & s2_n_442); 
assign s2_n_193 = (s2_n_590 & s1_n_442) ^ (s2_n_590 & s2_n_442); 

//  INVD1 g14218(.I (n_34), .ZN (n_144));  
assign s1_n_144 = ~s1_n_34; 
assign s2_n_144 = s2_n_34; 

//  NR2XD0 g14252__5115(.A1 (n_23), .A2 (n_7), .ZN (n_150));  
assign s1_n_150 = ~(s2_n_23 | s1_n_7) ^ (s2_n_23 & s2_n_7); 
assign s2_n_150 = (s1_n_23 & s1_n_7) ^ (s1_n_23 | s2_n_7); 

//  ND2D1 g14181__7482(.A1 (n_453), .A2 (n_32), .ZN (n_33));  
assign s1_n_33 = ~(s1_n_453 & s1_n_32) ^ (s1_n_453 & s2_n_32); 
assign s2_n_33 = (s2_n_453 & s1_n_32) ^ (s2_n_453 & s2_n_32); 

//  ND2D1 g14226__4733(.A1 (n_442), .A2 (n_87), .ZN (n_31));  
assign s1_n_31 = ~(s1_n_442 & s1_n_87) ^ (s1_n_442 & s2_n_87); 
assign s2_n_31 = (s2_n_442 & s1_n_87) ^ (s2_n_442 & s2_n_87); 

//  ND2D1 g14232__6161(.A1 (n_435), .A2 (n_87), .ZN (n_30));  
assign s1_n_30 = ~(s1_n_435 & s1_n_87) ^ (s1_n_435 & s2_n_87); 
assign s2_n_30 = (s2_n_435 & s1_n_87) ^ (s2_n_435 & s2_n_87); 

//  OR2XD1 g14178__9315(.A1 (n_28), .A2 (n_32), .Z (n_29));  
assign s1_n_29 = (s2_n_28 | s1_n_32) ^ (s2_n_28 & s2_n_32); 
assign s2_n_29 = (s1_n_28 & s1_n_32) ^ (s1_n_28 | s2_n_32); 

//  NR2XD0 g14223__9945(.A1 (n_95), .A2 (n_196), .ZN (n_27));  
assign s1_n_27 = ~(s2_n_95 | s1_n_196) ^ (s2_n_95 & s2_n_196); 
assign s2_n_27 = (s1_n_95 & s1_n_196) ^ (s1_n_95 | s2_n_196); 

//  ND2D1 g14180__2883(.A1 (n_435), .A2 (n_25), .ZN (n_26));  
assign s1_n_26 = ~(s1_n_435 & s1_n_25) ^ (s1_n_435 & s2_n_25); 
assign s2_n_26 = (s2_n_435 & s1_n_25) ^ (s2_n_435 & s2_n_25); 

//  NR2XD0 g14234__2346(.A1 (n_11), .A2 (n_23), .ZN (n_24));  
assign s1_n_24 = ~(s2_n_11 | s1_n_23) ^ (s2_n_11 & s2_n_23); 
assign s2_n_24 = (s1_n_11 & s1_n_23) ^ (s1_n_11 | s2_n_23); 

//  INVD1 g14168(.I (n_57), .ZN (n_22));  
assign s1_n_22 = ~s1_n_57; 
assign s2_n_22 = s2_n_57; 

//  ND2D1 g14228__1666(.A1 (n_152), .A2 (n_435), .ZN (n_21));  
assign s1_n_21 = ~(s1_n_152 & s1_n_435) ^ (s1_n_152 & s2_n_435); 
assign s2_n_21 = (s2_n_152 & s1_n_435) ^ (s2_n_152 & s2_n_435); 

//  INVD1 g14169(.I (n_116), .ZN (n_96));  
assign s1_n_96 = ~s1_n_116; 
assign s2_n_96 = s2_n_116; 

//  NR2D0 g14248__7410(.A1 (n_152), .A2 (n_317), .ZN (n_35));  
assign s1_n_35 = ~(s2_n_152 | s1_n_317) ^ (s2_n_152 & s2_n_317); 
assign s2_n_35 = (s1_n_152 & s1_n_317) ^ (s1_n_152 | s2_n_317); 

//  ND2D1 g14251__6417(.A1 (n_20), .A2 (n_115), .ZN (n_34));  
assign s1_n_34 = ~(s1_n_20 & s1_n_115) ^ (s1_n_20 & s2_n_115); 
assign s2_n_34 = (s2_n_20 & s1_n_115) ^ (s2_n_20 & s2_n_115); 

//  ND2D1 g14195__5477(.A1 (n_692), .A2 (n_735), .ZN (n_55));  
assign s1_n_55 = ~(s1_n_692 & s1_n_735) ^ (s1_n_692 & s2_n_735); 
assign s2_n_55 = (s2_n_692 & s1_n_735) ^ (s2_n_692 & s2_n_735); 

//  INVD1 g14173(.I (n_186), .ZN (n_73));  
assign s1_n_73 = ~s1_n_186; 
assign s2_n_73 = s2_n_186; 

//  ND2D1 g14241__2398(.A1 (n_49), .A2 (n_453), .ZN (n_603));  
assign s1_n_603 = ~(s1_n_49 & s1_n_453) ^ (s1_n_49 & s2_n_453); 
assign s2_n_603 = (s2_n_49 & s1_n_453) ^ (s2_n_49 & s2_n_453); 

//  INVD1 g14175(.I (n_204), .ZN (n_88));  
assign s1_n_88 = ~s1_n_204; 
assign s2_n_88 = s2_n_204; 

//  ND2D1 g14250__5107(.A1 (n_20), .A2 (sbox_in[6]), .ZN (n_72));  
assign s1_n_72 = ~(s1_n_20 & s1_sbox_in[6]) ^ (s1_n_20 & s2_sbox_in[6]); 
assign s2_n_72 = (s2_n_20 & s1_sbox_in[6]) ^ (s2_n_20 & s2_sbox_in[6]); 

//  INVD1 g14171(.I (n_56), .ZN (n_90));  
assign s1_n_90 = ~s1_n_56; 
assign s2_n_90 = s2_n_56; 

//  NR2D1 g14249__6260(.A1 (n_23), .A2 (sbox_in[6]), .ZN (n_107));  
assign s1_n_107 = ~(s2_n_23 | s1_sbox_in[6]) ^ (s2_n_23 & s2_sbox_in[6]); 
assign s2_n_107 = (s1_n_23 & s1_sbox_in[6]) ^ (s1_n_23 | s2_sbox_in[6]); 

//  NR2XD0 g14204__4319(.A1 (n_671), .A2 (sbox_in[5]), .ZN (n_336));  
assign s1_n_336 = ~(s2_n_671 | s1_sbox_in[5]) ^ (s2_n_671 & s2_sbox_in[5]); 
assign s2_n_336 = (s1_n_671 & s1_sbox_in[5]) ^ (s1_n_671 | s2_sbox_in[5]); 

//  NR2XD0 g14255__8428(.A1 (n_20), .A2 (n_115), .ZN (n_212));  
assign s1_n_212 = ~(s2_n_20 | s1_n_115) ^ (s2_n_20 & s2_n_115); 
assign s2_n_212 = (s1_n_20 & s1_n_115) ^ (s1_n_20 | s2_n_115); 

//  ND2D1 g14227__5526(.A1 (n_453), .A2 (n_152), .ZN (n_19));  
assign s1_n_19 = ~(s1_n_453 & s1_n_152) ^ (s1_n_453 & s2_n_152); 
assign s2_n_19 = (s2_n_453 & s1_n_152) ^ (s2_n_453 & s2_n_152); 

//  ND2D1 g14177__6783(.A1 (n_442), .A2 (sbox_in[0]), .ZN (n_18));  
assign s1_n_18 = ~(s1_n_442 & s1_sbox_in[0]) ^ (s1_n_442 & s2_sbox_in[0]); 
assign s2_n_18 = (s2_n_442 & s1_sbox_in[0]) ^ (s2_n_442 & s2_sbox_in[0]); 

//  ND2D1 g14224__3680(.A1 (n_453), .A2 (n_20), .ZN (n_17));  
assign s1_n_17 = ~(s1_n_453 & s1_n_20) ^ (s1_n_453 & s2_n_20); 
assign s2_n_17 = (s2_n_453 & s1_n_20) ^ (s2_n_453 & s2_n_20); 

//  NR2D0 g14189__1617(.A1 (n_180), .A2 (n_300), .ZN (n_16));  
assign s1_n_16 = ~(s2_n_180 | s1_n_300) ^ (s2_n_180 & s2_n_300); 
assign s2_n_16 = (s1_n_180 & s1_n_300) ^ (s1_n_180 | s2_n_300); 

//  ND2D1 g14185__2802(.A1 (n_453), .A2 (sbox_in[1]), .ZN (n_15));  
assign s1_n_15 = ~(s1_n_453 & s1_sbox_in[1]) ^ (s1_n_453 & s2_sbox_in[1]); 
assign s2_n_15 = (s2_n_453 & s1_sbox_in[1]) ^ (s2_n_453 & s2_sbox_in[1]); 

//  ND2D1 g14179__1705(.A1 (n_95), .A2 (sbox_in[2]), .ZN (n_14));  
assign s1_n_14 = ~(s1_n_95 & s1_sbox_in[2]) ^ (s1_n_95 & s2_sbox_in[2]); 
assign s2_n_14 = (s2_n_95 & s1_sbox_in[2]) ^ (s2_n_95 & s2_sbox_in[2]); 

//  ND2D1 g14186__5122(.A1 (n_412), .A2 (n_6), .ZN (n_13));  
assign s1_n_13 = ~(s1_n_412 & s1_n_6) ^ (s1_n_412 & s2_n_6); 
assign s2_n_13 = (s2_n_412 & s1_n_6) ^ (s2_n_412 & s2_n_6); 

//  ND2D1 g14188__8246(.A1 (n_84), .A2 (sbox_in[3]), .ZN (n_12));  
assign s1_n_12 = ~(s1_n_84 & s1_sbox_in[3]) ^ (s1_n_84 & s2_sbox_in[3]); 
assign s2_n_12 = (s2_n_84 & s1_sbox_in[3]) ^ (s2_n_84 & s2_sbox_in[3]); 

//  NR2D1 g14190__7098(.A1 (n_152), .A2 (n_196), .ZN (n_39));  
assign s1_n_39 = ~(s2_n_152 | s1_n_196) ^ (s2_n_152 & s2_n_196); 
assign s2_n_39 = (s1_n_152 & s1_n_196) ^ (s1_n_152 | s2_n_196); 

//  ND2D1 g14191__6131(.A1 (n_11), .A2 (n_2), .ZN (n_91));  
assign s1_n_91 = ~(s1_n_11 & s1_n_2) ^ (s1_n_11 & s2_n_2); 
assign s2_n_91 = (s2_n_11 & s1_n_2) ^ (s2_n_11 & s2_n_2); 

//  ND2D1 g14236__1881(.A1 (n_435), .A2 (n_20), .ZN (n_475));  
assign s1_n_475 = ~(s1_n_435 & s1_n_20) ^ (s1_n_435 & s2_n_20); 
assign s2_n_475 = (s2_n_435 & s1_n_20) ^ (s2_n_435 & s2_n_20); 

//  ND2D1 g14238__5115(.A1 (n_412), .A2 (n_692), .ZN (n_345));  
assign s1_n_345 = ~(s1_n_412 & s1_n_692) ^ (s1_n_412 & s2_n_692); 
assign s2_n_345 = (s2_n_412 & s1_n_692) ^ (s2_n_412 & s2_n_692); 

//  NR2D1 g14240__7482(.A1 (n_680), .A2 (sbox_in[5]), .ZN (n_633));  
assign s1_n_633 = ~(s2_n_680 | s1_sbox_in[5]) ^ (s2_n_680 & s2_sbox_in[5]); 
assign s2_n_633 = (s1_n_680 & s1_sbox_in[5]) ^ (s1_n_680 | s2_sbox_in[5]); 

//  ND2D1 g14198__4733(.A1 (n_665), .A2 (sbox_in[5]), .ZN (n_549));  
assign s1_n_549 = ~(s1_n_665 & s1_sbox_in[5]) ^ (s1_n_665 & s2_sbox_in[5]); 
assign s2_n_549 = (s2_n_665 & s1_sbox_in[5]) ^ (s2_n_665 & s2_sbox_in[5]); 

//  ND2D1 g14196__6161(.A1 (n_435), .A2 (n_10), .ZN (n_237));  
assign s1_n_237 = ~(s1_n_435 & s1_n_10) ^ (s1_n_435 & s2_n_10); 
assign s2_n_237 = (s2_n_435 & s1_n_10) ^ (s2_n_435 & s2_n_10); 

//  ND2D1 g14237__9315(.A1 (n_692), .A2 (n_442), .ZN (n_121));  
assign s1_n_121 = ~(s1_n_692 & s1_n_442) ^ (s1_n_692 & s2_n_442); 
assign s2_n_121 = (s2_n_692 & s1_n_442) ^ (s2_n_692 & s2_n_442); 

//  ND2D1 g14192__9945(.A1 (n_412), .A2 (sbox_in[4]), .ZN (n_388));  
assign s1_n_388 = ~(s1_n_412 & s1_sbox_in[4]) ^ (s1_n_412 & s2_sbox_in[4]); 
assign s2_n_388 = (s2_n_412 & s1_sbox_in[4]) ^ (s2_n_412 & s2_sbox_in[4]); 

//  ND2D1 g14193__2883(.A1 (n_453), .A2 (sbox_in[4]), .ZN (n_483));  
assign s1_n_483 = ~(s1_n_453 & s1_sbox_in[4]) ^ (s1_n_453 & s2_sbox_in[4]); 
assign s2_n_483 = (s2_n_453 & s1_sbox_in[4]) ^ (s2_n_453 & s2_sbox_in[4]); 

//  ND2D1 g14197__2346(.A1 (n_11), .A2 (sbox_in[2]), .ZN (n_614));  
assign s1_n_614 = ~(s1_n_11 & s1_sbox_in[2]) ^ (s1_n_11 & s2_sbox_in[2]); 
assign s2_n_614 = (s2_n_11 & s1_sbox_in[2]) ^ (s2_n_11 & s2_sbox_in[2]); 

//  INVD1 g14172(.I (n_70), .ZN (n_111));  
assign s1_n_111 = ~s1_n_70; 
assign s2_n_111 = s2_n_70; 

//  NR2XD0 g14253__1666(.A1 (n_20), .A2 (sbox_in[6]), .ZN (n_278));  
assign s1_n_278 = ~(s2_n_20 | s1_sbox_in[6]) ^ (s2_n_20 & s2_sbox_in[6]); 
assign s2_n_278 = (s1_n_20 & s1_sbox_in[6]) ^ (s1_n_20 | s2_sbox_in[6]); 

//  NR2XD0 g14208__7410(.A1 (n_9), .A2 (n_115), .ZN (n_249));  
assign s1_n_249 = ~(s2_n_9 | s1_n_115) ^ (s2_n_9 & s2_n_115); 
assign s2_n_249 = (s1_n_9 & s1_n_115) ^ (s1_n_9 | s2_n_115); 

//  NR2XD0 g14176__6417(.A1 (n_458), .A2 (sbox_in[0]), .ZN (n_8));  
assign s1_n_8 = ~(s2_n_458 | s1_sbox_in[0]) ^ (s2_n_458 & s2_sbox_in[0]); 
assign s2_n_8 = (s1_n_458 & s1_sbox_in[0]) ^ (s1_n_458 | s2_sbox_in[0]); 

//  INVD1 g14280(.I (n_20), .ZN (n_7));  
assign s1_n_7 = ~s1_n_20; 
assign s2_n_7 = s2_n_20; 

//  INVD1 g14279(.I (n_49), .ZN (n_42));  
assign s1_n_42 = ~s1_n_49; 
assign s2_n_42 = s2_n_49; 

//  NR2D1 g14201__5477(.A1 (n_6), .A2 (n_115), .ZN (n_57));  
assign s1_n_57 = ~(s2_n_6 | s1_n_115) ^ (s2_n_6 & s2_n_115); 
assign s2_n_57 = (s1_n_6 & s1_n_115) ^ (s1_n_6 | s2_n_115); 

//  INVD1 g14264(.I (n_692), .ZN (n_623));  
assign s1_n_623 = ~s1_n_692; 
assign s2_n_623 = s2_n_692; 

//  NR2XD0 g14206__2398(.A1 (n_6), .A2 (sbox_in[6]), .ZN (n_70));  
assign s1_n_70 = ~(s2_n_6 | s1_sbox_in[6]) ^ (s2_n_6 & s2_sbox_in[6]); 
assign s2_n_70 = (s1_n_6 & s1_sbox_in[6]) ^ (s1_n_6 | s2_sbox_in[6]); 

//  ND2D1 g14203__5107(.A1 (n_32), .A2 (n_115), .ZN (n_116));  
assign s1_n_116 = ~(s1_n_32 & s1_n_115) ^ (s1_n_32 & s2_n_115); 
assign s2_n_116 = (s2_n_32 & s1_n_115) ^ (s2_n_32 & s2_n_115); 

//  ND2D1 g14207__6260(.A1 (n_6), .A2 (sbox_in[6]), .ZN (n_186));  
assign s1_n_186 = ~(s1_n_6 & s1_sbox_in[6]) ^ (s1_n_6 & s2_sbox_in[6]); 
assign s2_n_186 = (s2_n_6 & s1_sbox_in[6]) ^ (s2_n_6 & s2_sbox_in[6]); 

//  INVD1 g14266(.I (n_442), .ZN (n_477));  
assign s1_n_477 = ~s1_n_442; 
assign s2_n_477 = s2_n_442; 

//  INVD1 g14286(.I (n_412), .ZN (n_491));  
assign s1_n_491 = ~s1_n_412; 
assign s2_n_491 = s2_n_412; 

//  INVD1 g14278(.I (n_11), .ZN (n_5));  
assign s1_n_5 = ~s1_n_11; 
assign s2_n_5 = s2_n_11; 

//  INVD1 g14284(.I (n_665), .ZN (n_53));  
assign s1_n_53 = ~s1_n_665; 
assign s2_n_53 = s2_n_665; 

//  INVD1 g14282(.I (n_317), .ZN (n_36));  
assign s1_n_36 = ~s1_n_317; 
assign s2_n_36 = s2_n_317; 

//  NR2D0 g14202__4319(.A1 (n_32), .A2 (n_115), .ZN (n_143));  
assign s1_n_143 = ~(s2_n_32 | s1_n_115) ^ (s2_n_32 & s2_n_115); 
assign s2_n_143 = (s1_n_32 & s1_n_115) ^ (s1_n_32 | s2_n_115); 

//  INVD1 g14262(.I (n_680), .ZN (n_647));  
assign s1_n_647 = ~s1_n_680; 
assign s2_n_647 = s2_n_680; 

//  INVD1 g14281(.I (n_23), .ZN (n_54));  
assign s1_n_54 = ~s1_n_23; 
assign s2_n_54 = s2_n_23; 

//  ND2D1 g14205__8428(.A1 (n_6), .A2 (n_115), .ZN (n_56));  
assign s1_n_56 = ~(s1_n_6 & s1_n_115) ^ (s1_n_6 & s2_n_115); 
assign s2_n_56 = (s2_n_6 & s1_n_115) ^ (s2_n_6 & s2_n_115); 

//  INVD1 g14283(.I (n_180), .ZN (n_284));  
assign s1_n_284 = ~s1_n_180; 
assign s2_n_284 = s2_n_180; 

//  INVD1 g14285(.I (n_671), .ZN (n_590));  
assign s1_n_590 = ~s1_n_671; 
assign s2_n_590 = s2_n_671; 

//  NR2XD0 g14209__5526(.A1 (n_32), .A2 (sbox_in[6]), .ZN (n_204));  
assign s1_n_204 = ~(s2_n_32 | s1_sbox_in[6]) ^ (s2_n_32 & s2_sbox_in[6]); 
assign s2_n_204 = (s1_n_32 & s1_sbox_in[6]) ^ (s1_n_32 | s2_sbox_in[6]); 

//  INVD1 g14287(.I (n_435), .ZN (n_444));  
assign s1_n_444 = ~s1_n_435; 
assign s2_n_444 = s2_n_435; 

//  INVD1 g14257(.I (n_196), .ZN (n_44));  
assign s1_n_44 = ~s1_n_196; 
assign s2_n_44 = s2_n_196; 

//  NR2XD0 g14267__6783(.A1 (n_115), .A2 (n_4), .ZN (n_28));  
assign s1_n_28 = ~(s2_n_115 | s1_n_4) ^ (s2_n_115 & s2_n_4); 
assign s2_n_28 = (s1_n_115 & s1_n_4) ^ (s1_n_115 | s2_n_4); 

//  ND2D1 g14290__3680(.A1 (n_3), .A2 (sbox_in[6]), .ZN (n_49));  
assign s1_n_49 = ~(s1_n_3 & s1_sbox_in[6]) ^ (s1_n_3 & s2_sbox_in[6]); 
assign s2_n_49 = (s2_n_3 & s1_sbox_in[6]) ^ (s2_n_3 & s2_sbox_in[6]); 

//  NR2D1 g14292__1617(.A1 (n_3), .A2 (sbox_in[0]), .ZN (n_23));  
assign s1_n_23 = ~(s2_n_3 | s1_sbox_in[0]) ^ (s2_n_3 & s2_sbox_in[0]); 
assign s2_n_23 = (s1_n_3 & s1_sbox_in[0]) ^ (s1_n_3 | s2_sbox_in[0]); 

//  ND2D1 g14297__2802(.A1 (n_10), .A2 (sbox_in[7]), .ZN (n_671));  
assign s1_n_671 = ~(s1_n_10 & s1_sbox_in[7]) ^ (s1_n_10 & s2_sbox_in[7]); 
assign s2_n_671 = (s2_n_10 & s1_sbox_in[7]) ^ (s2_n_10 & s2_sbox_in[7]); 

//  ND2D1 g14291__1705(.A1 (n_3), .A2 (sbox_in[0]), .ZN (n_20));  
assign s1_n_20 = ~(s1_n_3 & s1_sbox_in[0]) ^ (s1_n_3 & s2_sbox_in[0]); 
assign s2_n_20 = (s2_n_3 & s1_sbox_in[0]) ^ (s2_n_3 & s2_sbox_in[0]); 

//  NR2XD0 g14293__5122(.A1 (n_0), .A2 (sbox_in[6]), .ZN (n_317));  
assign s1_n_317 = ~(s2_n_0 | s1_sbox_in[6]) ^ (s2_n_0 & s2_sbox_in[6]); 
assign s2_n_317 = (s1_n_0 & s1_sbox_in[6]) ^ (s1_n_0 | s2_sbox_in[6]); 

//  NR2XD0 g14294__8246(.A1 (n_115), .A2 (sbox_in[0]), .ZN (n_152));  
assign s1_n_152 = ~(s2_n_115 | s1_sbox_in[0]) ^ (s2_n_115 & s2_sbox_in[0]); 
assign s2_n_152 = (s1_n_115 & s1_sbox_in[0]) ^ (s1_n_115 | s2_sbox_in[0]); 

//  NR2D1 g14296__7098(.A1 (n_10), .A2 (sbox_in[7]), .ZN (n_665));  
assign s1_n_665 = ~(s2_n_10 | s1_sbox_in[7]) ^ (s2_n_10 & s2_sbox_in[7]); 
assign s2_n_665 = (s1_n_10 & s1_sbox_in[7]) ^ (s1_n_10 | s2_sbox_in[7]); 

//  NR2D1 g14298__6131(.A1 (n_300), .A2 (sbox_in[3]), .ZN (n_412));  
assign s1_n_412 = ~(s2_n_300 | s1_sbox_in[3]) ^ (s2_n_300 & s2_sbox_in[3]); 
assign s2_n_412 = (s1_n_300 & s1_sbox_in[3]) ^ (s1_n_300 | s2_sbox_in[3]); 

//  INVD1 g14265(.I (n_458), .ZN (n_453));  
assign s1_n_453 = ~s1_n_458; 
assign s2_n_453 = s2_n_458; 

//  INVD1 g14258(.I (n_6), .ZN (n_2));  
assign s1_n_2 = ~s1_n_6; 
assign s2_n_2 = s2_n_6; 

//  INVD1 g14260(.I (n_32), .ZN (n_9));  
assign s1_n_9 = ~s1_n_32; 
assign s2_n_9 = s2_n_32; 

//  INVD1 g14259(.I (n_187), .ZN (n_25));  
assign s1_n_25 = ~s1_n_187; 
assign s2_n_25 = s2_n_187; 

//  NR2D1 g14288__1881(.A1 (n_10), .A2 (sbox_in[2]), .ZN (n_251));  
assign s1_n_251 = ~(s2_n_10 | s1_sbox_in[2]) ^ (s2_n_10 & s2_sbox_in[2]); 
assign s2_n_251 = (s1_n_10 & s1_sbox_in[2]) ^ (s1_n_10 | s2_sbox_in[2]); 

//  NR2XD0 g14289__5115(.A1 (n_115), .A2 (sbox_in[3]), .ZN (n_11));  
assign s1_n_11 = ~(s2_n_115 | s1_sbox_in[3]) ^ (s2_n_115 & s2_sbox_in[3]); 
assign s2_n_11 = (s1_n_115 & s1_sbox_in[3]) ^ (s1_n_115 | s2_sbox_in[3]); 

//  INVD1 g14263(.I (n_189), .ZN (n_84));  
assign s1_n_84 = ~s1_n_189; 
assign s2_n_84 = s2_n_189; 

//  INVD1 g14261(.I (n_87), .ZN (n_95));  
assign s1_n_95 = ~s1_n_87; 
assign s2_n_95 = s2_n_87; 

//  NR2XD0 g14295__7482(.A1 (n_3), .A2 (sbox_in[6]), .ZN (n_180));  
assign s1_n_180 = ~(s2_n_3 | s1_sbox_in[6]) ^ (s2_n_3 & s2_sbox_in[6]); 
assign s2_n_180 = (s1_n_3 & s1_sbox_in[6]) ^ (s1_n_3 | s2_sbox_in[6]); 

//  ND2D1 g14273__4733(.A1 (n_10), .A2 (n_1), .ZN (n_680));  
assign s1_n_680 = ~(s1_n_10 & s1_n_1) ^ (s1_n_10 & s2_n_1); 
assign s2_n_680 = (s2_n_10 & s1_n_1) ^ (s2_n_10 & s2_n_1); 

//  NR2XD0 g14275__6161(.A1 (n_10), .A2 (n_1), .ZN (n_692));  
assign s1_n_692 = ~(s2_n_10 | s1_n_1) ^ (s2_n_10 & s2_n_1); 
assign s2_n_692 = (s1_n_10 & s1_n_1) ^ (s1_n_10 | s2_n_1); 

//  AN2XD1 g14277__9315(.A1 (n_300), .A2 (n_4), .Z (n_442));  
assign s1_n_442 = (s1_n_300 & s1_n_4) ^ (s1_n_300 & s2_n_4); 
assign s2_n_442 = (s2_n_300 & s1_n_4) ^ (s2_n_300 & s2_n_4); 

//  AN2XD1 g14299__9945(.A1 (n_300), .A2 (sbox_in[3]), .Z (n_435));  
assign s1_n_435 = (s1_n_300 & s1_sbox_in[3]) ^ (s1_n_300 & s2_sbox_in[3]); 
assign s2_n_435 = (s2_n_300 & s1_sbox_in[3]) ^ (s2_n_300 & s2_sbox_in[3]); 

//  NR2XD0 g14268__2883(.A1 (sbox_in[6]), .A2 (sbox_in[1]), .ZN (n_196));  
assign s1_n_196 = ~(s2_sbox_in[6] | s1_sbox_in[1]) ^ (s2_sbox_in[6] & s2_sbox_in[1]); 
assign s2_n_196 = (s1_sbox_in[6] & s1_sbox_in[1]) ^ (s1_sbox_in[6] | s2_sbox_in[1]); 

//  ND2D1 g14269__2346(.A1 (sbox_in[1]), .A2 (sbox_in[0]), .ZN (n_6));  
assign s1_n_6 = ~(s1_sbox_in[1] & s1_sbox_in[0]) ^ (s1_sbox_in[1] & s2_sbox_in[0]); 
assign s2_n_6 = (s2_sbox_in[1] & s1_sbox_in[0]) ^ (s2_sbox_in[1] & s2_sbox_in[0]); 

//  ND2D1 g14272__1666(.A1 (sbox_in[6]), .A2 (sbox_in[0]), .ZN (n_87));  
assign s1_n_87 = ~(s1_sbox_in[6] & s1_sbox_in[0]) ^ (s1_sbox_in[6] & s2_sbox_in[0]); 
assign s2_n_87 = (s2_sbox_in[6] & s1_sbox_in[0]) ^ (s2_sbox_in[6] & s2_sbox_in[0]); 

//  NR2D1 g14270__7410(.A1 (sbox_in[6]), .A2 (sbox_in[0]), .ZN (n_187));  
assign s1_n_187 = ~(s2_sbox_in[6] | s1_sbox_in[0]) ^ (s2_sbox_in[6] & s2_sbox_in[0]); 
assign s2_n_187 = (s1_sbox_in[6] & s1_sbox_in[0]) ^ (s1_sbox_in[6] | s2_sbox_in[0]); 

//  NR2XD0 g14271__6417(.A1 (sbox_in[1]), .A2 (sbox_in[0]), .ZN (n_32));  
assign s1_n_32 = ~(s2_sbox_in[1] | s1_sbox_in[0]) ^ (s2_sbox_in[1] & s2_sbox_in[0]); 
assign s2_n_32 = (s1_sbox_in[1] & s1_sbox_in[0]) ^ (s1_sbox_in[1] | s2_sbox_in[0]); 

//  ND2D1 g14274__5477(.A1 (sbox_in[6]), .A2 (sbox_in[1]), .ZN (n_189));  
assign s1_n_189 = ~(s1_sbox_in[6] & s1_sbox_in[1]) ^ (s1_sbox_in[6] & s2_sbox_in[1]); 
assign s2_n_189 = (s2_sbox_in[6] & s1_sbox_in[1]) ^ (s2_sbox_in[6] & s2_sbox_in[1]); 

//  ND2D1 g14276__2398(.A1 (sbox_in[3]), .A2 (sbox_in[2]), .ZN (n_458));  
assign s1_n_458 = ~(s1_sbox_in[3] & s1_sbox_in[2]) ^ (s1_sbox_in[3] & s2_sbox_in[2]); 
assign s2_n_458 = (s2_sbox_in[3] & s1_sbox_in[2]) ^ (s2_sbox_in[3] & s2_sbox_in[2]); 

//  INVD1 g14304(.I (sbox_in[0]), .ZN (n_0));  
assign s1_n_0 = ~s1_sbox_in[0]; 
assign s2_n_0 = s2_sbox_in[0]; 

//  INVD1 g14302(.I (sbox_in[3]), .ZN (n_4));  
assign s1_n_4 = ~s1_sbox_in[3]; 
assign s2_n_4 = s2_sbox_in[3]; 

//  INVD1 g14306(.I (sbox_in[2]), .ZN (n_300));  
assign s1_n_300 = ~s1_sbox_in[2]; 
assign s2_n_300 = s2_sbox_in[2]; 

//  INVD1 g14307(.I (sbox_in[6]), .ZN (n_115));  
assign s1_n_115 = ~s1_sbox_in[6]; 
assign s2_n_115 = s2_sbox_in[6]; 

//  INVD1 g14300(.I (sbox_in[7]), .ZN (n_1));  
assign s1_n_1 = ~s1_sbox_in[7]; 
assign s2_n_1 = s2_sbox_in[7]; 

//  INVD1 g14301(.I (sbox_in[1]), .ZN (n_3));  
assign s1_n_3 = ~s1_sbox_in[1]; 
assign s2_n_3 = s2_sbox_in[1]; 

//  INVD1 g14305(.I (sbox_in[4]), .ZN (n_10));  
assign s1_n_10 = ~s1_sbox_in[4]; 
assign s2_n_10 = s2_sbox_in[4]; 

//  INVD1 g14303(.I (sbox_in[5]), .ZN (n_735));  
assign s1_n_735 = ~s1_sbox_in[5]; 
assign s2_n_735 = s2_sbox_in[5]; 

//  OR2D1 g2(.A1 (n_119), .A2 (n_170), .Z (n_785));  
assign s1_n_785 = (s2_n_119 | s1_n_170) ^ (s2_n_119 & s2_n_170); 
assign s2_n_785 = (s1_n_119 & s1_n_170) ^ (s1_n_119 | s2_n_170); 

endmodule 


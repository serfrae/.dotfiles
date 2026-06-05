// Preload shim for the Zed Solidity language server
// (@nomicfoundation/solidity-language-server).
//
// Its Hardhat validation worker loads solc-js, which does
//   globalThis.crypto = <something>
// in strict mode. On Node >= 20, `globalThis.crypto` is exposed as a
// getter-only accessor property (descriptor: get set, no setter). Assigning to
// a getter-only property in strict mode throws:
//   "Cannot set property crypto of #<Object> which has only a getter"
// which makes every validation run fail (validationRun: false in Zed's logs).
//
// Redefining `crypto` as a writable data property — keeping the exact same Web
// Crypto value, so `crypto.subtle` / `crypto.randomUUID` still work — lets that
// assignment succeed. This is preloaded via NODE_OPTIONS (see ./node) so it also
// lands in the forked validation worker, not just the main LSP process.
try {
  Object.defineProperty(globalThis, "crypto", {
    value: globalThis.crypto,
    writable: true,
    configurable: true,
    enumerable: false,
  });
} catch (_) {
  // Older Node (no global crypto) or an already-writable slot: nothing to do.
}

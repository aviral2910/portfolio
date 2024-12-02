'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "4df179f142d83b88f412b3cbed430379",
"splash/img/dark-1x.gif": "865c464c451a56876bae13be218c0b3b",
"splash/splash.js": "cbe915283d5c3385fe43c58618f59bda",
"splash/style.css": "b627c47d71ae2d110f0f2d996f5dee0d",
"index.html": "5f9af663338f4cf09f37636acedff115",
"/": "5f9af663338f4cf09f37636acedff115",
"main.dart.js": "7c97f95e473d7cbf25fd9577f57b0df4",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "d6eba4f8aa361a2503e3a68632d9c683",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7e66be4c60574316a2a458421626f69e",
"assets/AssetManifest.json": "ff10fc211f380d1770e5f0e2610948df",
"assets/NOTICES": "2f3544342ad0d0104ec582e08aa5b7da",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "c879b63e3e0a19d1038bcf4af6054d3c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "c2716c0888c37a8398f61cdb972c43e2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "4c8eebfbbc6059d109125e1a10009d03",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/aviraldark1.webp": "7fadcd5a496e76167e43b1f7d9aae1e8",
"assets/assets/images/python.webp": "aeecec13627e3ac1332fa2431422b254",
"assets/assets/images/linkedin.webp": "3af1b84ec6c67e98472c0d8859fb058f",
"assets/assets/images/resume.webp": "7c2edba5e18c1d9d33a60e245ce286d8",
"assets/assets/images/case.webp": "ee2bf9ff1e24a4f5c4e0934aeb0db31f",
"assets/assets/images/figma.webp": "37d7cb2401d10524a962ad4a20a4e0b5",
"assets/assets/images/profile.webp": "5f431298abd92c2db15669d69a91e7ca",
"assets/assets/images/html5.webp": "7cd044c2abaf4e1d8bc25512d312f31f",
"assets/assets/images/contact.webp": "aad314f06b283c5db5ef7151087d8d05",
"assets/assets/images/github.webp": "a9240ea5395f50a6af8b786363f51e62",
"assets/assets/images/aviral1.webp": "2bdb7115dc393009a7ced410e4d96673",
"assets/assets/images/link.webp": "a499024c1e11c6b39d747047451d38b6",
"assets/assets/images/springboot.webp": "bcd5e85992c110ec2d3c166df25cb94d",
"assets/assets/images/dart.webp": "0e6e50f2a4a84fa607d280e886b27dd3",
"assets/assets/images/case1.webp": "4117bc68beaf49af5aa12df4d31f39cd",
"assets/assets/images/aviral.webp": "5abd4308a55a9feece1222cf7904da15",
"assets/assets/images/firebase.webp": "39923512205d619f421ef02375e0b256",
"assets/assets/images/css.webp": "5529a4ca1f1b3bb4ff3ee5473a40fcf5",
"assets/assets/images/testimonial.webp": "872837932e5f68ca73faddf0cb3927ba",
"assets/assets/images/qmark.webp": "2f020192078f5e62e66113af8ea04863",
"assets/assets/images/react.webp": "ca68c305e2a0b2ed5c10a9b945211a97",
"assets/assets/images/casebg.webp": "ef4fd568f8d0bc93e304af7fa7e86f53",
"assets/assets/images/sql.webp": "cab8b8721bfca620f4eff20179bcdab8",
"assets/assets/images/aviraldp.webp": "7475b9bb0be9edcf26ea17838cf2c640",
"assets/assets/images/telephone.webp": "6d337ae61d6da5e528947963f0d7beb6",
"assets/assets/images/arrow.webp": "9ed8baa0eb836deaca8d41ce6f1403b4",
"assets/assets/images/aviraldark.webp": "a342d7468678413822488c01827e4dcb",
"assets/assets/images/gmail.webp": "28ff1096dd9578ded0d1b9a1e638b3f3",
"assets/assets/images/flask.webp": "4a63bfdc153cf131707f198eef8434e3",
"assets/assets/images/case2.webp": "e47da77418a3b3471147f6031ca9fe89",
"assets/assets/images/download.webp": "0717e31d985d894703b8ee57b8afdfbc",
"assets/assets/images/klc.webp": "5b5e0c2b3f02d29ab01883f14d2a049b",
"assets/assets/images/django.webp": "48ddea8491fd49b1dbcb1a4ff5e619e2",
"assets/assets/images/s1.webp": "f360cc4c6cf257de6b88a34ad573d743",
"assets/assets/images/github2.webp": "e27410b4742960bb6da262c631a0e56f",
"assets/assets/images/adobexd.webp": "65899bc34b62e5a69423024d79a2204a",
"assets/assets/images/website.webp": "09ad9540317c12028aae1cfc889a3774",
"assets/assets/images/flutter.webp": "f46ddc0744b6c315539df01ca3ad78ac",
"assets/assets/images/project.webp": "4b6e0d66e53d88911c155cd4f9453690",
"assets/assets/images/playstore.webp": "34c4a0800af1d6b3f58b97c41a5b2846",
"assets/assets/images/java.webp": "65c3386cf5520d913d58c3512c1a0d9c",
"assets/assets/images/block.webp": "9f4be1c89aa32a2582f2fcf053393ebf",
"assets/assets/images/appstore.webp": "c0d7290f2bc46a9eb586ee5fa71ff156",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

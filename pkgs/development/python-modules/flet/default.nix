{ lib
, buildPythonPackage
, fetchPypi
, pythonRelaxDepsHook

# build-system
, poetry-core

# propagates
, fastapi
, flet-core
, flet-runtime
, httpx
, oauthlib
, packaging
, qrcode
, cookiecutter
, uvicorn
, watchdog
, websocket-client
, websockets

}:

buildPythonPackage rec {
  pname = "flet";
  version = "0.21.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YAMZku8jbdQ8JvUr5aLATIGIiTDmG6CGvfUKo28q7ks=";
  };

  nativeBuildInputs = [
    poetry-core
    pythonRelaxDepsHook
  ];

  pythonRelaxDeps = [
    "websockets"
  ];

  propagatedBuildInputs = [
    fastapi
    flet-core
    flet-runtime
    uvicorn
    websocket-client
    watchdog
    oauthlib
    websockets
    httpx
    packaging
    qrcode
    cookiecutter
  ];

  doCheck = false;

  pythonImportsCheck = [
    "flet"
  ];

  meta = {
    description = "A framework that enables you to easily build realtime web, mobile, and desktop apps in Python";
    homepage = "https://flet.dev/";
    changelog = "https://github.com/flet-dev/flet/releases/tag/v${version}";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.heyimnova ];
    mainProgram = "flet";
  };
}
